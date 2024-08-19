import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/firestore_category_repository.dart';
import '../domain/category.dart';

final streamCategoriesProvider = StreamProvider<List<Category>?>((ref) {
  final firestoreCategoryRepository =
      ref.read(firestoreCategoryRepositoryProvider);
  return firestoreCategoryRepository.getCategories();
});