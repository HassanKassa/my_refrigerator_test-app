
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../category_management/riverpods/items_category_provider.dart';
import '../../../category_management/riverpods/stream_categories_provider.dart';
import '../../../category_management/riverpods/tips_category_provider.dart';
import '../../../common/components/base_scaffold.dart';
import '../../../common/components/categories_bar.dart';
import '../../../common/components/searching_and_filtering.dart';
import '../../../common/widgets/category_button.dart';
import '../../../common/widgets/right_floating_button.dart';
import '../../riverpods/stream_tips_provider.dart';
import 'add_tips.dart';

class StorageTips extends ConsumerWidget {
  const StorageTips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tipsListAsyncValue = ref.watch(streamTipsProvider);
    final categoriesAsyncValue = ref.watch(streamCategoriesProvider);

    return BaseScaffold(
      currentIndex: 2,
      pageMainTitle: 'Storage Tips',
      pageSubTitle: 'List of Storage Tips',
      myelements: [
        const SearchingAndFiltering(),
        const SizedBox(height: 10),
        categoriesAsyncValue.when(
          data: (categories) {
            return CategoriesBar(
              additionaltem: Consumer(builder: (context, ref, child) {
                final selectedCategory = ref.watch(selectedTipCategoryProvider);
                return CategoryButton(
                    label: 'All ',
                    selected: selectedCategory == 'All',
                    onPressed: () {
                      ref.read(selectedTipCategoryProvider.notifier).state =
                          'All';
                      ref.read(selectedCategoryProvider.notifier).state = '';
                    });
              }),
              categories:
                  categories?.map((category) => category.name).toList() ?? [],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
        ),
        Expanded(
            child: tipsListAsyncValue.when(
          data: (tips) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ...tips?.map((tip) {
                        return Card(
                          color: Colors.white,
                          child: ListTile(
                            tileColor: Colors.white,
                            title: Text(
                              tip.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            subtitle: Text(tip.details,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color(0xff575E71))),
                          ),
                        );
                      }) ??
                      []
                ],
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
        ))
      ],
      addLayer: const RightFloatingButton(
        theDestenation: AddTips(),
        theIcon: Icons.tips_and_updates_outlined,
      ),
    );
  }
}
