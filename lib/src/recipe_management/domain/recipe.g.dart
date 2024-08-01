// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeImpl _$$RecipeImplFromJson(Map<String, dynamic> json) => _$RecipeImpl(
      recipeId: json['recipeId'] as String?,
      photo: json['photo'] as String?,
      category: json['category'] as String,
      name: json['name'] as String,
      ingredients: json['ingredients'] as String,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$$RecipeImplToJson(_$RecipeImpl instance) =>
    <String, dynamic>{
      'recipeId': instance.recipeId,
      'photo': instance.photo,
      'category': instance.category,
      'name': instance.name,
      'ingredients': instance.ingredients,
      'details': instance.details,
    };
