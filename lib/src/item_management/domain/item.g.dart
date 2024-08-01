// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      itemId: json['itemId'] as String?,
      photo: json['photo'] as String?,
      category: json['category'] as String,
      name: json['name'] as String,
      purchaseDate: DateTime.parse(json['purchaseDate'] as String),
      expirationDate: DateTime.parse(json['expirationDate'] as String),
      quantity: (json['quantity'] as num).toDouble(),
      unit: $enumDecode(_$UnitEnumMap, json['unit']),
      marketName: json['marketName'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'photo': instance.photo,
      'category': instance.category,
      'name': instance.name,
      'purchaseDate': instance.purchaseDate.toIso8601String(),
      'expirationDate': instance.expirationDate.toIso8601String(),
      'quantity': instance.quantity,
      'unit': _$UnitEnumMap[instance.unit]!,
      'marketName': instance.marketName,
      'notes': instance.notes,
    };

const _$UnitEnumMap = {
  Unit.gr: 'gr',
  Unit.kg: 'kg',
  Unit.lit: 'lit',
};
