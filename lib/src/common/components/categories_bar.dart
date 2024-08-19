// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../category_management/riverpods/items_category_provider.dart';
import '../../category_management/riverpods/recipes_category_provider.dart';
import '../../category_management/riverpods/tips_category_provider.dart';
import '../widgets/category_button.dart';

class CategoriesBar extends StatelessWidget {
  final List<String> categories;
  final Widget additionaltem;

  const CategoriesBar({
    super.key,
    required this.additionaltem,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Consumer(builder: (context, ref, child) {
          final selectedCategory = ref.watch(selectedCategoryProvider);
          return Row(
            children: [
              ...categories.map(
                (e) => CategoryButton(
                  onPressed: () {
                    ref.read(selectedCategoryProvider.notifier).state = e;
                    ref.read(selectedTipCategoryProvider.notifier).state = e;
                    ref.read(selectedRecipeCategoryProvider.notifier).state = e;
                  },
                  label: e,
                  selected: selectedCategory == e,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              additionaltem
            ],
          );
        }),
      ),
    );
  }
}
