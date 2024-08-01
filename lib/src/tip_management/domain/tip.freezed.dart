// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Tip _$TipFromJson(Map<String, dynamic> json) {
  return _Tip.fromJson(json);
}

/// @nodoc
mixin _$Tip {
  String? get tipId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TipCopyWith<Tip> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TipCopyWith<$Res> {
  factory $TipCopyWith(Tip value, $Res Function(Tip) then) =
      _$TipCopyWithImpl<$Res, Tip>;
  @useResult
  $Res call({String? tipId, String? name, String? details, String? category});
}

/// @nodoc
class _$TipCopyWithImpl<$Res, $Val extends Tip> implements $TipCopyWith<$Res> {
  _$TipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tipId = freezed,
    Object? name = freezed,
    Object? details = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      tipId: freezed == tipId
          ? _value.tipId
          : tipId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TipImplCopyWith<$Res> implements $TipCopyWith<$Res> {
  factory _$$TipImplCopyWith(_$TipImpl value, $Res Function(_$TipImpl) then) =
      __$$TipImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? tipId, String? name, String? details, String? category});
}

/// @nodoc
class __$$TipImplCopyWithImpl<$Res> extends _$TipCopyWithImpl<$Res, _$TipImpl>
    implements _$$TipImplCopyWith<$Res> {
  __$$TipImplCopyWithImpl(_$TipImpl _value, $Res Function(_$TipImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tipId = freezed,
    Object? name = freezed,
    Object? details = freezed,
    Object? category = freezed,
  }) {
    return _then(_$TipImpl(
      tipId: freezed == tipId
          ? _value.tipId
          : tipId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TipImpl implements _Tip {
  _$TipImpl({this.tipId, this.name, this.details, this.category});

  factory _$TipImpl.fromJson(Map<String, dynamic> json) =>
      _$$TipImplFromJson(json);

  @override
  final String? tipId;
  @override
  final String? name;
  @override
  final String? details;
  @override
  final String? category;

  @override
  String toString() {
    return 'Tip(tipId: $tipId, name: $name, details: $details, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TipImpl &&
            (identical(other.tipId, tipId) || other.tipId == tipId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tipId, name, details, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TipImplCopyWith<_$TipImpl> get copyWith =>
      __$$TipImplCopyWithImpl<_$TipImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TipImplToJson(
      this,
    );
  }
}

abstract class _Tip implements Tip {
  factory _Tip(
      {final String? tipId,
      final String? name,
      final String? details,
      final String? category}) = _$TipImpl;

  factory _Tip.fromJson(Map<String, dynamic> json) = _$TipImpl.fromJson;

  @override
  String? get tipId;
  @override
  String? get name;
  @override
  String? get details;
  @override
  String? get category;
  @override
  @JsonKey(ignore: true)
  _$$TipImplCopyWith<_$TipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
