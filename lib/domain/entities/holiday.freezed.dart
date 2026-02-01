// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'holiday.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Holiday {
  DateTime get date => throw _privateConstructorUsedError;
  String get localName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;
  bool get fixed => throw _privateConstructorUsedError;
  bool get global => throw _privateConstructorUsedError;
  List<String>? get counties => throw _privateConstructorUsedError;
  List<String>? get types => throw _privateConstructorUsedError;

  /// Create a copy of Holiday
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HolidayCopyWith<Holiday> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HolidayCopyWith<$Res> {
  factory $HolidayCopyWith(Holiday value, $Res Function(Holiday) then) =
      _$HolidayCopyWithImpl<$Res, Holiday>;
  @useResult
  $Res call({
    DateTime date,
    String localName,
    String name,
    String countryCode,
    bool fixed,
    bool global,
    List<String>? counties,
    List<String>? types,
  });
}

/// @nodoc
class _$HolidayCopyWithImpl<$Res, $Val extends Holiday>
    implements $HolidayCopyWith<$Res> {
  _$HolidayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Holiday
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? localName = null,
    Object? name = null,
    Object? countryCode = null,
    Object? fixed = null,
    Object? global = null,
    Object? counties = freezed,
    Object? types = freezed,
  }) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            localName: null == localName
                ? _value.localName
                : localName // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            countryCode: null == countryCode
                ? _value.countryCode
                : countryCode // ignore: cast_nullable_to_non_nullable
                      as String,
            fixed: null == fixed
                ? _value.fixed
                : fixed // ignore: cast_nullable_to_non_nullable
                      as bool,
            global: null == global
                ? _value.global
                : global // ignore: cast_nullable_to_non_nullable
                      as bool,
            counties: freezed == counties
                ? _value.counties
                : counties // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            types: freezed == types
                ? _value.types
                : types // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HolidayImplCopyWith<$Res> implements $HolidayCopyWith<$Res> {
  factory _$$HolidayImplCopyWith(
    _$HolidayImpl value,
    $Res Function(_$HolidayImpl) then,
  ) = __$$HolidayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime date,
    String localName,
    String name,
    String countryCode,
    bool fixed,
    bool global,
    List<String>? counties,
    List<String>? types,
  });
}

/// @nodoc
class __$$HolidayImplCopyWithImpl<$Res>
    extends _$HolidayCopyWithImpl<$Res, _$HolidayImpl>
    implements _$$HolidayImplCopyWith<$Res> {
  __$$HolidayImplCopyWithImpl(
    _$HolidayImpl _value,
    $Res Function(_$HolidayImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Holiday
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? localName = null,
    Object? name = null,
    Object? countryCode = null,
    Object? fixed = null,
    Object? global = null,
    Object? counties = freezed,
    Object? types = freezed,
  }) {
    return _then(
      _$HolidayImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        localName: null == localName
            ? _value.localName
            : localName // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        countryCode: null == countryCode
            ? _value.countryCode
            : countryCode // ignore: cast_nullable_to_non_nullable
                  as String,
        fixed: null == fixed
            ? _value.fixed
            : fixed // ignore: cast_nullable_to_non_nullable
                  as bool,
        global: null == global
            ? _value.global
            : global // ignore: cast_nullable_to_non_nullable
                  as bool,
        counties: freezed == counties
            ? _value._counties
            : counties // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        types: freezed == types
            ? _value._types
            : types // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// @nodoc

class _$HolidayImpl extends _Holiday {
  const _$HolidayImpl({
    required this.date,
    required this.localName,
    required this.name,
    required this.countryCode,
    required this.fixed,
    required this.global,
    final List<String>? counties,
    final List<String>? types,
  }) : _counties = counties,
       _types = types,
       super._();

  @override
  final DateTime date;
  @override
  final String localName;
  @override
  final String name;
  @override
  final String countryCode;
  @override
  final bool fixed;
  @override
  final bool global;
  final List<String>? _counties;
  @override
  List<String>? get counties {
    final value = _counties;
    if (value == null) return null;
    if (_counties is EqualUnmodifiableListView) return _counties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _types;
  @override
  List<String>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Holiday(date: $date, localName: $localName, name: $name, countryCode: $countryCode, fixed: $fixed, global: $global, counties: $counties, types: $types)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HolidayImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.localName, localName) ||
                other.localName == localName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.fixed, fixed) || other.fixed == fixed) &&
            (identical(other.global, global) || other.global == global) &&
            const DeepCollectionEquality().equals(other._counties, _counties) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    date,
    localName,
    name,
    countryCode,
    fixed,
    global,
    const DeepCollectionEquality().hash(_counties),
    const DeepCollectionEquality().hash(_types),
  );

  /// Create a copy of Holiday
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HolidayImplCopyWith<_$HolidayImpl> get copyWith =>
      __$$HolidayImplCopyWithImpl<_$HolidayImpl>(this, _$identity);
}

abstract class _Holiday extends Holiday {
  const factory _Holiday({
    required final DateTime date,
    required final String localName,
    required final String name,
    required final String countryCode,
    required final bool fixed,
    required final bool global,
    final List<String>? counties,
    final List<String>? types,
  }) = _$HolidayImpl;
  const _Holiday._() : super._();

  @override
  DateTime get date;
  @override
  String get localName;
  @override
  String get name;
  @override
  String get countryCode;
  @override
  bool get fixed;
  @override
  bool get global;
  @override
  List<String>? get counties;
  @override
  List<String>? get types;

  /// Create a copy of Holiday
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HolidayImplCopyWith<_$HolidayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
