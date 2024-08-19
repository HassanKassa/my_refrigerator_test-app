// ignore_for_file: avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../domain/item.dart';
import 'item_repository.dart';

final firestoreItemRepositoryProvider = Provider((ref) {
  return FirestoreItemRepository(); ////////////////
});

class FirestoreItemRepository implements ItemRepository {
  FirestoreItemRepository();
  final firestore = FirebaseFirestore.instance.collection("Items");

  @override
  Future<void> createItem(Item item) async {
    try {
      await firestore.add(item.toJson());
      print("Success");
    } catch (error) {
      print("Error: ${error.toString()}");
    }
  }

  @override
  Future<void> deleteItem(String itemId) async {
    try {
      await firestore.doc(itemId).delete();
    } catch (error) {
      print("Error deleting item: ${error.toString()}");
    }
  }

  @override
  Stream<List<Item>?> getItems(String category) {
    if (category == "All") {
      return firestore
          .orderBy("purchaseDate", descending: true)
          .snapshots()
          .map((event) {
        return event.docs
            .map((e) => Item.fromJson(e.data()).copyWith(itemId: e.id))
            .toList();
      });
    }
    return firestore
        .where("category", isEqualTo: category)
        .orderBy("purchaseDate", descending: true)
        .snapshots()
        .map((event) {
      return event.docs
          .map((e) => Item.fromJson(e.data()).copyWith(itemId: e.id))
          .toList();
    });
  }

  @override
  Future<void> updateItem(Item item) async {
    try {
      await firestore.doc(item.itemId).update(
            item.toJson(),
          );
      print("Item updated successfully");
    } catch (error) {
      print("Error updating item: ${error.toString()}");
    }
  }

  Future<String?> saveProfileImage(File photo, String destination) async {
    if (photo.path == '') return null;
    final ref = FirebaseStorage.instance.ref(destination);
    await ref.putFile(photo);
    final String downloadUrl = await ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> deleteProfileImage(String imageURL) async {
    await FirebaseStorage.instance.refFromURL(imageURL).delete();
  }
}
