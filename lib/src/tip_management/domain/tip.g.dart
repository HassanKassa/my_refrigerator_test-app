// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TipImpl _$$TipImplFromJson(Map<String, dynamic> json) => _$TipImpl(
      tipId: json['tipId'] as String?,
      name: json['name'] as String,
      details: json['details'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$$TipImplToJson(_$TipImpl instance) => <String, dynamic>{
      'tipId': instance.tipId,
      'name': instance.name,
      'details': instance.details,
      'category': instance.category,
    };
