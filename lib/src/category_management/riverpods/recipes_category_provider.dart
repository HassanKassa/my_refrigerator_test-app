import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedRecipeCategoryProvider =
    StateProvider.autoDispose((ref) => 'All');