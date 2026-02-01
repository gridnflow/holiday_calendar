// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'holiday_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HolidayModel _$HolidayModelFromJson(Map<String, dynamic> json) {
  return _HolidayModel.fromJson(json);
}

/// @nodoc
mixin _$HolidayModel {
  String get date => throw _privateConstructorUsedError;
  String get localName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;
  bool get fixed => throw _privateConstructorUsedError;
  bool get global => throw _privateConstructorUsedError;
  List<String>? get counties => throw _privateConstructorUsedError;
  List<String>? get types => throw _privateConstructorUsedError;

  /// Serializes this HolidayModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HolidayModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HolidayModelCopyWith<HolidayModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HolidayModelCopyWith<$Res> {
  factory $HolidayModelCopyWith(
    HolidayModel value,
    $Res Function(HolidayModel) then,
  ) = _$HolidayModelCopyWithImpl<$Res, HolidayModel>;
  @useResult
  $Res call({
    String date,
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
class _$HolidayModelCopyWithImpl<$Res, $Val extends HolidayModel>
    implements $HolidayModelCopyWith<$Res> {
  _$HolidayModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HolidayModel
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
                      as String,
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
abstract class _$$HolidayModelImplCopyWith<$Res>
    implements $HolidayModelCopyWith<$Res> {
  factory _$$HolidayModelImplCopyWith(
    _$HolidayModelImpl value,
    $Res Function(_$HolidayModelImpl) then,
  ) = __$$HolidayModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String date,
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
class __$$HolidayModelImplCopyWithImpl<$Res>
    extends _$HolidayModelCopyWithImpl<$Res, _$HolidayModelImpl>
    implements _$$HolidayModelImplCopyWith<$Res> {
  __$$HolidayModelImplCopyWithImpl(
    _$HolidayModelImpl _value,
    $Res Function(_$HolidayModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HolidayModel
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
      _$HolidayModelImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
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
@JsonSerializable()
class _$HolidayModelImpl extends _HolidayModel {
  const _$HolidayModelImpl({
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

  factory _$HolidayModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HolidayModelImplFromJson(json);

  @override
  final String date;
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
    return 'HolidayModel(date: $date, localName: $localName, name: $name, countryCode: $countryCode, fixed: $fixed, global: $global, counties: $counties, types: $types)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HolidayModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of HolidayModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HolidayModelImplCopyWith<_$HolidayModelImpl> get copyWith =>
      __$$HolidayModelImplCopyWithImpl<_$HolidayModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HolidayModelImplToJson(this);
  }
}

abstract class _HolidayModel extends HolidayModel {
  const factory _HolidayModel({
    required final String date,
    required final String localName,
    required final String name,
    required final String countryCode,
    required final bool fixed,
    required final bool global,
    final List<String>? counties,
    final List<String>? types,
  }) = _$HolidayModelImpl;
  const _HolidayModel._() : super._();

  factory _HolidayModel.fromJson(Map<String, dynamic> json) =
      _$HolidayModelImpl.fromJson;

  @override
  String get date;
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

  /// Create a copy of HolidayModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HolidayModelImplCopyWith<_$HolidayModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
