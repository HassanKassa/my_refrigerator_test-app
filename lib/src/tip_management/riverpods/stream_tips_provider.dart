import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../category_management/riverpods/tips_category_provider.dart';
import '../../common/riverpod/providers.dart';
import '../data/firestore_tip_repository.dart';
import '../domain/tip.dart';

final streamTipsProvider = StreamProvider.autoDispose<List<Tip>?>((ref) {
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
        ?.where((tip) => tip.name.toLowerCase().contains(searchProcess))
        .toList();
  });
});