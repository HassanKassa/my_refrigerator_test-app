
import '../domain/item.dart';

abstract class ItemRepository {
  Future<void> createItem(Item item);
  Future<void> updateItem(Item item);
  Future<void> deleteItem(String itemId);
  Stream<List<Item>?> getItems(String category);
}
