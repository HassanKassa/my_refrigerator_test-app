import '../domain/category.dart';

abstract class CategoryRepository {
  Future<void> createCategory(Category category);
  Stream<List<Category>?> getCategories();
  
}
