// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return _Recipe.fromJson(json);
}

/// @nodoc
mixin _$Recipe {
  String? get recipeId => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get ingredients => throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res, Recipe>;
  @useResult
  $Res call(
      {String? recipeId,
      String? photo,
      String category,
      String name,
      String ingredients,
      String? details});
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res, $Val extends Recipe>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeId = freezed,
    Object? photo = freezed,
    Object? category = null,
    Object? name = null,
    Object? ingredients = null,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      recipeId: freezed == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeImplCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$$RecipeImplCopyWith(
          _$RecipeImpl value, $Res Function(_$RecipeImpl) then) =
      __$$RecipeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? recipeId,
      String? photo,
      String category,
      String name,
      String ingredients,
      String? details});
}

/// @nodoc
class __$$RecipeImplCopyWithImpl<$Res>
    extends _$RecipeCopyWithImpl<$Res, _$RecipeImpl>
    implements _$$RecipeImplCopyWith<$Res> {
  __$$RecipeImplCopyWithImpl(
      _$RecipeImpl _value, $Res Function(_$RecipeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeId = freezed,
    Object? photo = freezed,
    Object? category = null,
    Object? name = null,
    Object? ingredients = null,
    Object? details = freezed,
  }) {
    return _then(_$RecipeImpl(
      recipeId: freezed == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeImpl implements _Recipe {
  _$RecipeImpl(
      {this.recipeId,
      this.photo,
      required this.category,
      required this.name,
      required this.ingredients,
      this.details});

  factory _$RecipeImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeImplFromJson(json);

  @override
  final String? recipeId;
  @override
  final String? photo;
  @override
  final String category;
  @override
  final String name;
  @override
  final String ingredients;
  @override
  final String? details;

  @override
  String toString() {
    return 'Recipe(recipeId: $recipeId, photo: $photo, category: $category, name: $name, ingredients: $ingredients, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeImpl &&
            (identical(other.recipeId, recipeId) ||
                other.recipeId == recipeId) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ingredients, ingredients) ||
                other.ingredients == ingredients) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, recipeId, photo, category, name, ingredients, details);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      __$$RecipeImplCopyWithImpl<_$RecipeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeImplToJson(
      this,
    );
  }
}

abstract class _Recipe implements Recipe {
  factory _Recipe(
      {final String? recipeId,
      final String? photo,
      required final String category,
      required final String name,
      required final String ingredients,
      final String? details}) = _$RecipeImpl;

  factory _Recipe.fromJson(Map<String, dynamic> json) = _$RecipeImpl.fromJson;

  @override
  String? get recipeId;
  @override
  String? get photo;
  @override
  String get category;
  @override
  String get name;
  @override
  String get ingredients;
  @override
  String? get details;
  @override
  @JsonKey(ignore: true)
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
