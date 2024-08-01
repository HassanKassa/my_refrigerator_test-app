// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../riverpod/providers.dart';
import '../../data/firestore_item_repository.dart';
import '../../../common/components/categories_bar.dart';
import '../../../common/components/item_card.dart';
import '../../../common/components/base_scaffold.dart';
import '../../../common/components/searching_and_filtering.dart';
import '../../../common/widgets/category_button.dart';
import '../../../edit_item.dart';

class MyRefrigerator extends ConsumerWidget {
  const MyRefrigerator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemListAsyncValue = ref.watch(streamItemsProvider);
    final categoriesAsyncValue = ref.watch(streamCategoriesProvider);

    return BaseScaffold(
      currentIndex: 0,
      myelements: [
        SearchingAndFiltering(),
        SizedBox(height: 10),
        categoriesAsyncValue.when(
          data: (categories) {
            return CategoriesBar(
              additionaltem: Consumer(builder: (context, ref, child) {
                final selectedCategory = ref.watch(selectedCategoryProvider);
                return CategoryButton(
                    label: 'All ',
                    selected: selectedCategory == 'All',
                    onPressed: () {
            
                      ref.read(selectedCategoryProvider.notifier).state =
                          'All';
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
            child: itemListAsyncValue.when(
          data: (items) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ...items?.map((item) {
                        final unit =
                            item.unit.toString().replaceAll('Unit.', '');
                        return ItemCard(
                          name: item.name,
                          onDelete: () {
                            ref
                                .read(firestoreItemRepositoryProvider)
                                .deleteItem(item.itemId!);
                          },onEdit: () {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => EditItem(item: item),
    ),
  );
},

                          
                          daysLeft: item.expirationDate
                              .difference(DateTime.now())
                              .inDays,
                          quantity: '${item.quantity} $unit',
                          cardImage: item.photo ?? "assets/images/tomato.jpg",
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
      pageMainTitle: 'My Refrigerator',
      pageSubTitle: 'List of items in my refrigerator',
      addLayer: SizedBox(),
    );
  }
}
