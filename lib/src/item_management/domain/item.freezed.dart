// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  String? get itemId => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get purchaseDate => throw _privateConstructorUsedError;
  DateTime get expirationDate => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  Unit get unit => throw _privateConstructorUsedError;
  String? get marketName => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {String? itemId,
      String? photo,
      String category,
      String name,
      DateTime purchaseDate,
      DateTime expirationDate,
      double quantity,
      Unit unit,
      String? marketName,
      String? notes});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = freezed,
    Object? photo = freezed,
    Object? category = null,
    Object? name = null,
    Object? purchaseDate = null,
    Object? expirationDate = null,
    Object? quantity = null,
    Object? unit = null,
    Object? marketName = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      itemId: freezed == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
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
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit,
      marketName: freezed == marketName
          ? _value.marketName
          : marketName // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
          _$ItemImpl value, $Res Function(_$ItemImpl) then) =
      __$$ItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? itemId,
      String? photo,
      String category,
      String name,
      DateTime purchaseDate,
      DateTime expirationDate,
      double quantity,
      Unit unit,
      String? marketName,
      String? notes});
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ItemCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = freezed,
    Object? photo = freezed,
    Object? category = null,
    Object? name = null,
    Object? purchaseDate = null,
    Object? expirationDate = null,
    Object? quantity = null,
    Object? unit = null,
    Object? marketName = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$ItemImpl(
      itemId: freezed == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
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
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit,
      marketName: freezed == marketName
          ? _value.marketName
          : marketName // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemImpl implements _Item {
  _$ItemImpl(
      {this.itemId,
      this.photo,
      required this.category,
      required this.name,
      required this.purchaseDate,
      required this.expirationDate,
      required this.quantity,
      required this.unit,
      this.marketName,
      this.notes});

  factory _$ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemImplFromJson(json);

  @override
  final String? itemId;
  @override
  final String? photo;
  @override
  final String category;
  @override
  final String name;
  @override
  final DateTime purchaseDate;
  @override
  final DateTime expirationDate;
  @override
  final double quantity;
  @override
  final Unit unit;
  @override
  final String? marketName;
  @override
  final String? notes;

  @override
  String toString() {
    return 'Item(itemId: $itemId, photo: $photo, category: $category, name: $name, purchaseDate: $purchaseDate, expirationDate: $expirationDate, quantity: $quantity, unit: $unit, marketName: $marketName, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.marketName, marketName) ||
                other.marketName == marketName) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, itemId, photo, category, name,
      purchaseDate, expirationDate, quantity, unit, marketName, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemImplToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  factory _Item(
      {final String? itemId,
      final String? photo,
      required final String category,
      required final String name,
      required final DateTime purchaseDate,
      required final DateTime expirationDate,
      required final double quantity,
      required final Unit unit,
      final String? marketName,
      final String? notes}) = _$ItemImpl;

  factory _Item.fromJson(Map<String, dynamic> json) = _$ItemImpl.fromJson;

  @override
  String? get itemId;
  @override
  String? get photo;
  @override
  String get category;
  @override
  String get name;
  @override
  DateTime get purchaseDate;
  @override
  DateTime get expirationDate;
  @override
  double get quantity;
  @override
  Unit get unit;
  @override
  String? get marketName;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
