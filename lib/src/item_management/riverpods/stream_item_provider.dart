import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../category_management/riverpods/items_category_provider.dart';
import '../../common/riverpod/providers.dart';
import '../data/firestore_item_repository.dart';
import '../domain/item.dart';

final streamItemsProvider = StreamProvider.autoDispose<List<Item>?>((ref) {
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