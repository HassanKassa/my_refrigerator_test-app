import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';


@freezed
class Recipe with _$Recipe {
  factory Recipe({
    String? recipeId,
    String? photo,
    required String category,
    required String name,
    required String ingredients,
    String? details,

  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
