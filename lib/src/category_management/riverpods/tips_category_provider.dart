import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedTipCategoryProvider =
    StateProvider.autoDispose((ref) => 'All');