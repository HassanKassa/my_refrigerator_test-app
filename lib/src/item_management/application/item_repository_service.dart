import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:ordered_app/src/item_management/data/firestore_item_repository.dart';

import '../domain/item.dart';

final itemRepositoryServiceProvider = Provider((ref) {
  final firestoreItemRepository = ref.watch(firestoreItemRepositoryProvider);
  return ItemRepositoryService(firestoreItemRepository);
});

class ItemRepositoryService {
  final FirestoreItemRepository firestoreItemRepository;
  ItemRepositoryService(
    this.firestoreItemRepository,
  );
  Future<void> createRefrigeratorItems(FormGroup formGroup) async {
    try {
      String? imageURL;
      final imagePath = formGroup.control("photo").value;
      if (imagePath != null) {
        File profileImage = File(imagePath);
        imageURL = await firestoreItemRepository.saveProfileImage(profileImage,
            "/items/${DateTime.now().toIso8601String()}}/image.jpg");
      }
      final item = Item(
        photo: imageURL,
        category: formGroup.control('category').value,
        name: formGroup.control('name').value,
        purchaseDate: formGroup.control('purchaseDate').value,
        expirationDate: formGroup.control('expirationDate').value,
        quantity: formGroup.control('quantity').value,
        unit: formGroup.control('unit').value,
        marketName: formGroup.control('marketName').value,
        notes: formGroup.control('notes').value,
      );

      await firestoreItemRepository.createItem(item);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateRefrigeratorItems(
      FormGroup formGroup, Item oldItem) async {
    try {
      String? imageURL;
      final imagePath = formGroup.control("photo").value;
      if (imagePath != null) {
        if (imagePath != oldItem.photo) {
          if (oldItem.photo != null) {
            await firestoreItemRepository.deleteProfileImage(oldItem.photo!);
          }

          File profileImage = File(imagePath);
          imageURL = await firestoreItemRepository.saveProfileImage(
              profileImage,
              "/items/${DateTime.now().toIso8601String()}}/image.jpg");
        }
      }

      final item = oldItem.copyWith(
        photo: imageURL,
        category: formGroup.control('category').value,
        name: formGroup.control('name').value,
        purchaseDate: formGroup.control('purchaseDate').value,
        expirationDate: formGroup.control('expirationDate').value,
        quantity: formGroup.control('quantity').value,
        unit: formGroup.control('unit').value,
        marketName: formGroup.control('marketName').value,
        notes: formGroup.control('notes').value,
      );

      await firestoreItemRepository.updateItem(item);
    } catch (e) {
      rethrow;
    }
  }
}
