import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../category_management/riverpods/recipes_category_provider.dart';
import '../../common/riverpod/providers.dart';
import '../data/firestore_recipe_repository.dart';
import '../domain/recipe.dart';

final streamRecipesProvider = StreamProvider.autoDispose<List<Recipe>?>((ref) {
  final searchProcess = ref.watch(searchProcessProvider).toLowerCase();
  final selectedRecipeCategory = ref.watch(selectedRecipeCategoryProvider);
  return ref
      .read(firestoreRecipeRepositoryProvider)
      .getRecipes(selectedRecipeCategory)
      .map((recipes) {
    if (searchProcess.isEmpty) {
      return recipes;
    }
    return recipes
        ?.where((recipe) => recipe.name.toLowerCase().contains(searchProcess))
        .toList();
  });
});