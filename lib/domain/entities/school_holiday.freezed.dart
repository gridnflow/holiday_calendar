// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'school_holiday.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SchoolHoliday {
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  String get localName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get subdivisionCode => throw _privateConstructorUsedError;

  /// Create a copy of SchoolHoliday
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SchoolHolidayCopyWith<SchoolHoliday> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchoolHolidayCopyWith<$Res> {
  factory $SchoolHolidayCopyWith(
    SchoolHoliday value,
    $Res Function(SchoolHoliday) then,
  ) = _$SchoolHolidayCopyWithImpl<$Res, SchoolHoliday>;
  @useResult
  $Res call({
    DateTime startDate,
    DateTime endDate,
    String localName,
    String name,
    String subdivisionCode,
  });
}

/// @nodoc
class _$SchoolHolidayCopyWithImpl<$Res, $Val extends SchoolHoliday>
    implements $SchoolHolidayCopyWith<$Res> {
  _$SchoolHolidayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SchoolHoliday
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? localName = null,
    Object? name = null,
    Object? subdivisionCode = null,
  }) {
    return _then(
      _value.copyWith(
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endDate: null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            localName: null == localName
                ? _value.localName
                : localName // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            subdivisionCode: null == subdivisionCode
                ? _value.subdivisionCode
                : subdivisionCode // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SchoolHolidayImplCopyWith<$Res>
    implements $SchoolHolidayCopyWith<$Res> {
  factory _$$SchoolHolidayImplCopyWith(
    _$SchoolHolidayImpl value,
    $Res Function(_$SchoolHolidayImpl) then,
  ) = __$$SchoolHolidayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime startDate,
    DateTime endDate,
    String localName,
    String name,
    String subdivisionCode,
  });
}

/// @nodoc
class __$$SchoolHolidayImplCopyWithImpl<$Res>
    extends _$SchoolHolidayCopyWithImpl<$Res, _$SchoolHolidayImpl>
    implements _$$SchoolHolidayImplCopyWith<$Res> {
  __$$SchoolHolidayImplCopyWithImpl(
    _$SchoolHolidayImpl _value,
    $Res Function(_$SchoolHolidayImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SchoolHoliday
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? localName = null,
    Object? name = null,
    Object? subdivisionCode = null,
  }) {
    return _then(
      _$SchoolHolidayImpl(
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endDate: null == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        localName: null == localName
            ? _value.localName
            : localName // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        subdivisionCode: null == subdivisionCode
            ? _value.subdivisionCode
            : subdivisionCode // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SchoolHolidayImpl extends _SchoolHoliday {
  const _$SchoolHolidayImpl({
    required this.startDate,
    required this.endDate,
    required this.localName,
    required this.name,
    required this.subdivisionCode,
  }) : super._();

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final String localName;
  @override
  final String name;
  @override
  final String subdivisionCode;

  @override
  String toString() {
    return 'SchoolHoliday(startDate: $startDate, endDate: $endDate, localName: $localName, name: $name, subdivisionCode: $subdivisionCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SchoolHolidayImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.localName, localName) ||
                other.localName == localName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.subdivisionCode, subdivisionCode) ||
                other.subdivisionCode == subdivisionCode));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    startDate,
    endDate,
    localName,
    name,
    subdivisionCode,
  );

  /// Create a copy of SchoolHoliday
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SchoolHolidayImplCopyWith<_$SchoolHolidayImpl> get copyWith =>
      __$$SchoolHolidayImplCopyWithImpl<_$SchoolHolidayImpl>(this, _$identity);
}

abstract class _SchoolHoliday extends SchoolHoliday {
  const factory _SchoolHoliday({
    required final DateTime startDate,
    required final DateTime endDate,
    required final String localName,
    required final String name,
    required final String subdivisionCode,
  }) = _$SchoolHolidayImpl;
  const _SchoolHoliday._() : super._();

  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  String get localName;
  @override
  String get name;
  @override
  String get subdivisionCode;

  /// Create a copy of SchoolHoliday
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SchoolHolidayImplCopyWith<_$SchoolHolidayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
