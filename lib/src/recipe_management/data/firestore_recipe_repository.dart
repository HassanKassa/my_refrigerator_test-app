// ignore_for_file: avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/riverpod/providers.dart';
import '../domain/recipe.dart';
import 'recipe_repository.dart';

final firestoreRecipeRepositoryProvider = Provider((ref) {
  final image = ref.watch(imageRecipeProvider);
  return FirestoreRecipeRepository(image);
});

class FirestoreRecipeRepository implements RecipeRepository {
  final String? image;
  FirestoreRecipeRepository(this.image);
  final firestore = FirebaseFirestore.instance.collection("Recipes");

  @override
  Future<void> createRecipe(Recipe recipe) async {
    try {
      String? imageURL;
      final imagePath = image;
      if (imagePath != null) {
        File profileImage = File(imagePath);
        imageURL = await saveProfileImage(profileImage,
            "/recipes/${DateTime.now().toIso8601String()}}/image.jpg");
      }

      await firestore.add(recipe.copyWith(photo: imageURL).toJson());
      print("Success");
    } catch (error) {
      print("Error: ${error.toString()}");
    }
  }

  @override
  Stream<List<Recipe>?> getRecipes(String category) {
    if (category == "All") {
      return firestore
          .orderBy("name", descending: true)
          .snapshots()
          .map((event) {
        return event.docs
            .map((e) => Recipe.fromJson(e.data()).copyWith(recipeId: e.id))
            .toList();
      });
    }
    return firestore
        .where("category", isEqualTo: category)
        .orderBy("name", descending: true)
        .snapshots()
        .map((event) {
      return event.docs
          .map((e) => Recipe.fromJson(e.data()).copyWith(recipeId: e.id))
          .toList();
    });
  }

  Future<String?> saveProfileImage(File photo, String destination) async {
    if (photo.path == '') return null;
    final ref = FirebaseStorage.instance.ref(destination);
    await ref.putFile(photo);
    final String downloadUrl = await ref.getDownloadURL();
    return downloadUrl;
  }
}
