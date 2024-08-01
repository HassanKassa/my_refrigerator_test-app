import '../domain/recipe.dart';

abstract class RecipeRepository {
  Future<void> createRecipe(Recipe recipe);
  Stream<List<Recipe>?> getRecipes(String category);
}
