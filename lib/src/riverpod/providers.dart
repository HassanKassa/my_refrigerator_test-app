import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../recipe_management/domain/recipe.dart';
import '../tip_management/data/firestore_tip_repository.dart';
import '../tip_management/domain/tip.dart';
import '../category_management/data/firestore_category_repository.dart';
import '../category_management/domain/category.dart';
import '../item_management/data/firestore_item_repository.dart';
import '../item_management/domain/item.dart';
import '../recipe_management/data/firestore_recipe_repository.dart';

////////Items////////
final streamItemsProvider = StreamProvider<List<Item>?>((ref) {
  final selectedCategory = ref.watch(selectedCategoryProvider);
  final searchProcess = ref.watch(searchProcessProvider).toLowerCase();

  return ref
      .read(firestoreItemRepositoryProvider)
      .getItems(selectedCategory)
      .map((items) {
    if (searchProcess.isEmpty) {
      return items;
    }
    return items
        ?.where((item) => item.name.toLowerCase().contains(searchProcess))
        .toList();
  });
});

////////Tips////////
final streamTipsProvider = StreamProvider<List<Tip>?>((ref) {
  final searchProcess = ref.watch(searchProcessProvider).toLowerCase();
  final selectedTipCategory = ref.watch(selectedTipCategoryProvider);
  return ref
      .read(firestoreTipRepositoryProvider)
      .getTips(selectedTipCategory)
      .map((tips) {
    if (searchProcess.isEmpty) {
      return tips;
    }
    return tips
        ?.where((tip) => tip.name!.toLowerCase().contains(searchProcess))
        .toList();
  });
});
////////Recipes////////
final streamRecipesProvider = StreamProvider<List<Recipe>?>((ref) {
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
////////Categories////////
final streamCategoriesProvider = StreamProvider<List<Category>?>((ref) {
  final firestoreCategoryRepository =
      ref.read(firestoreCategoryRepositoryProvider);
  return firestoreCategoryRepository.getCategories();
});
////////addItem////////
final selectedUnitProvider = StateProvider<Unit?>((ref) => null);
final purchaseDateProvider = StateProvider<String?>((ref) => null);
final expirationDateProvider = StateProvider<String?>((ref) => null);
////////Image////////
final imageProvider = StateProvider<String?>((ref) => null);
////////Searching////////
final searchProcessProvider = StateProvider<String>((ref) => '');
////////CategoriesBar////////
final selectedCategoryProvider = StateProvider<String>((ref) => "All");
final selectedTipCategoryProvider = StateProvider<String>((ref) => "All");
final selectedRecipeCategoryProvider = StateProvider((ref) => 'All');
