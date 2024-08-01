// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ordered_app/src/category_management/domain/category.dart';
import 'category_repository.dart';

final firestoreCategoryRepositoryProvider =
    Provider((ref) => FirestoreCategoryRepository());

class FirestoreCategoryRepository implements CategoryRepository {
  final firestore = FirebaseFirestore.instance.collection("Categories");

@override
  Future<void> createCategory(Category category) async {
    try {
      await firestore.add(category.toJson());
      print("Success");
    } catch (error) {
      print("Error: ${error.toString()}");
    }
  }

  @override
  Stream<List<Category>?> getCategories() {
    return firestore.snapshots().map((event) {
      return event.docs
          .map((e) => Category.fromJson(e.data()).copyWith(categoryId: e.id))
          .toList();
    });
  }

  
}
