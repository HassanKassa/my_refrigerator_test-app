// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ordered_app/src/recipe_management/presentation/pages/add_new_recipe.dart';
import '../../../common/components/base_scaffold.dart';
import '../../../common/components/categories_bar.dart';
import '../../../common/components/searching_and_filtering.dart';
import '../../../common/widgets/category_button.dart';
import '../../../common/widgets/recipe_card.dart';
import '../../../common/widgets/right_floating_button.dart';
import '../../../riverpod/providers.dart';

class Recipes extends ConsumerWidget {
  const Recipes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipesListAsyncValue = ref.watch(streamRecipesProvider);
    final categoriesAsyncValue = ref.watch(streamCategoriesProvider);
    return BaseScaffold(
      currentIndex: 1,
      pageMainTitle: 'Recipes',
      pageSubTitle: 'List of Shared Recipes',
      myelements: [
        SearchingAndFiltering(),
        SizedBox(height: 10),
        categoriesAsyncValue.when(
          data: (categories) {
            return CategoriesBar(
              additionaltem: Consumer(builder: (context, ref, child) {
                final selectedCategory =
                    ref.watch(selectedRecipeCategoryProvider);
                return CategoryButton(
                    label: 'All ',
                    selected: selectedCategory == 'All',
                    onPressed: () {
                      ref.read(selectedRecipeCategoryProvider.notifier).state =
                          'All';
                      ref.read(selectedCategoryProvider.notifier).state = '';
                    });
              }),
              categories:
                  categories?.map((category) => category.name).toList() ?? [],
            );
          },
          loading: () => Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
        ),
        Expanded(
            child: recipesListAsyncValue.when(
          data: (recipes) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ...recipes?.map((recipe) {
                        return RecipeCard(
                          myimageasset:
                              recipe.photo ?? 'assets/images/salad.png',
                          title: recipe.name,
                          ingredients:
                              "a ${recipe.name} is compound of: ${recipe.ingredients}",
                          likes: 1500,
                          comments: 250,
                          shares: 25,
                          favorites: 150,
                          details: recipe.details,
                        );
                      }) ??
                      []
                ],
              ),
            );
          },
          loading: () => Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
        ))
      ],
      addLayer: RightFloatingButton(
          theIcon: Icons.menu_book_outlined, theDestenation: AddNewRecipe()),
    );
  }
}
