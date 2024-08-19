import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedCategoryProvider =
    StateProvider.autoDispose<String>((ref) => "All");