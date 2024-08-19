import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ordered_app/src/recipe_management/data/firestore_recipe_repository.dart';
import 'package:ordered_app/src/recipe_management/domain/recipe.dart';
import 'package:reactive_forms/reactive_forms.dart';

final recipeRepositoryServiceProvider = Provider((ref) {
  final firestoreRecipeRepository = ref.watch(firestoreRecipeRepositoryProvider);
  return RecipeRepositoryService(firestoreRecipeRepository);
});

class RecipeRepositoryService {
  final FirestoreRecipeRepository firestoreRecipeRepository;
  RecipeRepositoryService(
    this.firestoreRecipeRepository,
  );
  Future<void> createRecipes(FormGroup formGroup) async {
    try {
      final recipe = Recipe(
        photo: formGroup.control('photo').value,
        category: formGroup.control('category').value,
        name: formGroup.control('name').value,
        details: formGroup.control('details').value,
        ingredients: formGroup.control('ingredients').value,
      );

      await firestoreRecipeRepository.createRecipe(recipe);
    } catch (e) {
      rethrow;
    }
  }
}
