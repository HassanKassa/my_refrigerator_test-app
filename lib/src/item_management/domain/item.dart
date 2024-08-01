import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

enum Unit { gr, kg, lit }

@freezed
class Item with _$Item {
  factory Item({
    String? itemId,
    String? photo,
    required String category,
    required String name,
    required DateTime purchaseDate,
    required DateTime expirationDate,
    required double quantity,
    required Unit unit,
    String? marketName,
    String? notes,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
