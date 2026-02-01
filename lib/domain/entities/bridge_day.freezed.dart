// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bridge_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BridgeDay {
  DateTime get date => throw _privateConstructorUsedError;
  int get vacationDaysNeeded => throw _privateConstructorUsedError;
  int get totalDaysOff => throw _privateConstructorUsedError;
  double get efficiency => throw _privateConstructorUsedError;
  Holiday get relatedHoliday => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Create a copy of BridgeDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BridgeDayCopyWith<BridgeDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BridgeDayCopyWith<$Res> {
  factory $BridgeDayCopyWith(BridgeDay value, $Res Function(BridgeDay) then) =
      _$BridgeDayCopyWithImpl<$Res, BridgeDay>;
  @useResult
  $Res call({
    DateTime date,
    int vacationDaysNeeded,
    int totalDaysOff,
    double efficiency,
    Holiday relatedHoliday,
    String? description,
  });

  $HolidayCopyWith<$Res> get relatedHoliday;
}

/// @nodoc
class _$BridgeDayCopyWithImpl<$Res, $Val extends BridgeDay>
    implements $BridgeDayCopyWith<$Res> {
  _$BridgeDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BridgeDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? vacationDaysNeeded = null,
    Object? totalDaysOff = null,
    Object? efficiency = null,
    Object? relatedHoliday = null,
    Object? description = freezed,
  }) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            vacationDaysNeeded: null == vacationDaysNeeded
                ? _value.vacationDaysNeeded
                : vacationDaysNeeded // ignore: cast_nullable_to_non_nullable
                      as int,
            totalDaysOff: null == totalDaysOff
                ? _value.totalDaysOff
                : totalDaysOff // ignore: cast_nullable_to_non_nullable
                      as int,
            efficiency: null == efficiency
                ? _value.efficiency
                : efficiency // ignore: cast_nullable_to_non_nullable
                      as double,
            relatedHoliday: null == relatedHoliday
                ? _value.relatedHoliday
                : relatedHoliday // ignore: cast_nullable_to_non_nullable
                      as Holiday,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of BridgeDay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HolidayCopyWith<$Res> get relatedHoliday {
    return $HolidayCopyWith<$Res>(_value.relatedHoliday, (value) {
      return _then(_value.copyWith(relatedHoliday: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BridgeDayImplCopyWith<$Res>
    implements $BridgeDayCopyWith<$Res> {
  factory _$$BridgeDayImplCopyWith(
    _$BridgeDayImpl value,
    $Res Function(_$BridgeDayImpl) then,
  ) = __$$BridgeDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime date,
    int vacationDaysNeeded,
    int totalDaysOff,
    double efficiency,
    Holiday relatedHoliday,
    String? description,
  });

  @override
  $HolidayCopyWith<$Res> get relatedHoliday;
}

/// @nodoc
class __$$BridgeDayImplCopyWithImpl<$Res>
    extends _$BridgeDayCopyWithImpl<$Res, _$BridgeDayImpl>
    implements _$$BridgeDayImplCopyWith<$Res> {
  __$$BridgeDayImplCopyWithImpl(
    _$BridgeDayImpl _value,
    $Res Function(_$BridgeDayImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BridgeDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? vacationDaysNeeded = null,
    Object? totalDaysOff = null,
    Object? efficiency = null,
    Object? relatedHoliday = null,
    Object? description = freezed,
  }) {
    return _then(
      _$BridgeDayImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        vacationDaysNeeded: null == vacationDaysNeeded
            ? _value.vacationDaysNeeded
            : vacationDaysNeeded // ignore: cast_nullable_to_non_nullable
                  as int,
        totalDaysOff: null == totalDaysOff
            ? _value.totalDaysOff
            : totalDaysOff // ignore: cast_nullable_to_non_nullable
                  as int,
        efficiency: null == efficiency
            ? _value.efficiency
            : efficiency // ignore: cast_nullable_to_non_nullable
                  as double,
        relatedHoliday: null == relatedHoliday
            ? _value.relatedHoliday
            : relatedHoliday // ignore: cast_nullable_to_non_nullable
                  as Holiday,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$BridgeDayImpl extends _BridgeDay {
  const _$BridgeDayImpl({
    required this.date,
    required this.vacationDaysNeeded,
    required this.totalDaysOff,
    required this.efficiency,
    required this.relatedHoliday,
    this.description,
  }) : super._();

  @override
  final DateTime date;
  @override
  final int vacationDaysNeeded;
  @override
  final int totalDaysOff;
  @override
  final double efficiency;
  @override
  final Holiday relatedHoliday;
  @override
  final String? description;

  @override
  String toString() {
    return 'BridgeDay(date: $date, vacationDaysNeeded: $vacationDaysNeeded, totalDaysOff: $totalDaysOff, efficiency: $efficiency, relatedHoliday: $relatedHoliday, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BridgeDayImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.vacationDaysNeeded, vacationDaysNeeded) ||
                other.vacationDaysNeeded == vacationDaysNeeded) &&
            (identical(other.totalDaysOff, totalDaysOff) ||
                other.totalDaysOff == totalDaysOff) &&
            (identical(other.efficiency, efficiency) ||
                other.efficiency == efficiency) &&
            (identical(other.relatedHoliday, relatedHoliday) ||
                other.relatedHoliday == relatedHoliday) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    date,
    vacationDaysNeeded,
    totalDaysOff,
    efficiency,
    relatedHoliday,
    description,
  );

  /// Create a copy of BridgeDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BridgeDayImplCopyWith<_$BridgeDayImpl> get copyWith =>
      __$$BridgeDayImplCopyWithImpl<_$BridgeDayImpl>(this, _$identity);
}

abstract class _BridgeDay extends BridgeDay {
  const factory _BridgeDay({
    required final DateTime date,
    required final int vacationDaysNeeded,
    required final int totalDaysOff,
    required final double efficiency,
    required final Holiday relatedHoliday,
    final String? description,
  }) = _$BridgeDayImpl;
  const _BridgeDay._() : super._();

  @override
  DateTime get date;
  @override
  int get vacationDaysNeeded;
  @override
  int get totalDaysOff;
  @override
  double get efficiency;
  @override
  Holiday get relatedHoliday;
  @override
  String? get description;

  /// Create a copy of BridgeDay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BridgeDayImplCopyWith<_$BridgeDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BridgeDayRecommendation {
  List<DateTime> get bridgeDays => throw _privateConstructorUsedError;
  int get vacationDaysNeeded => throw _privateConstructorUsedError;
  int get totalDaysOff => throw _privateConstructorUsedError;
  double get efficiency => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  List<Holiday> get relatedHolidays => throw _privateConstructorUsedError;

  /// Create a copy of BridgeDayRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BridgeDayRecommendationCopyWith<BridgeDayRecommendation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BridgeDayRecommendationCopyWith<$Res> {
  factory $BridgeDayRecommendationCopyWith(
    BridgeDayRecommendation value,
    $Res Function(BridgeDayRecommendation) then,
  ) = _$BridgeDayRecommendationCopyWithImpl<$Res, BridgeDayRecommendation>;
  @useResult
  $Res call({
    List<DateTime> bridgeDays,
    int vacationDaysNeeded,
    int totalDaysOff,
    double efficiency,
    DateTime startDate,
    DateTime endDate,
    List<Holiday> relatedHolidays,
  });
}

/// @nodoc
class _$BridgeDayRecommendationCopyWithImpl<
  $Res,
  $Val extends BridgeDayRecommendation
>
    implements $BridgeDayRecommendationCopyWith<$Res> {
  _$BridgeDayRecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BridgeDayRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bridgeDays = null,
    Object? vacationDaysNeeded = null,
    Object? totalDaysOff = null,
    Object? efficiency = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? relatedHolidays = null,
  }) {
    return _then(
      _value.copyWith(
            bridgeDays: null == bridgeDays
                ? _value.bridgeDays
                : bridgeDays // ignore: cast_nullable_to_non_nullable
                      as List<DateTime>,
            vacationDaysNeeded: null == vacationDaysNeeded
                ? _value.vacationDaysNeeded
                : vacationDaysNeeded // ignore: cast_nullable_to_non_nullable
                      as int,
            totalDaysOff: null == totalDaysOff
                ? _value.totalDaysOff
                : totalDaysOff // ignore: cast_nullable_to_non_nullable
                      as int,
            efficiency: null == efficiency
                ? _value.efficiency
                : efficiency // ignore: cast_nullable_to_non_nullable
                      as double,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endDate: null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            relatedHolidays: null == relatedHolidays
                ? _value.relatedHolidays
                : relatedHolidays // ignore: cast_nullable_to_non_nullable
                      as List<Holiday>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BridgeDayRecommendationImplCopyWith<$Res>
    implements $BridgeDayRecommendationCopyWith<$Res> {
  factory _$$BridgeDayRecommendationImplCopyWith(
    _$BridgeDayRecommendationImpl value,
    $Res Function(_$BridgeDayRecommendationImpl) then,
  ) = __$$BridgeDayRecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<DateTime> bridgeDays,
    int vacationDaysNeeded,
    int totalDaysOff,
    double efficiency,
    DateTime startDate,
    DateTime endDate,
    List<Holiday> relatedHolidays,
  });
}

/// @nodoc
class __$$BridgeDayRecommendationImplCopyWithImpl<$Res>
    extends
        _$BridgeDayRecommendationCopyWithImpl<
          $Res,
          _$BridgeDayRecommendationImpl
        >
    implements _$$BridgeDayRecommendationImplCopyWith<$Res> {
  __$$BridgeDayRecommendationImplCopyWithImpl(
    _$BridgeDayRecommendationImpl _value,
    $Res Function(_$BridgeDayRecommendationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BridgeDayRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bridgeDays = null,
    Object? vacationDaysNeeded = null,
    Object? totalDaysOff = null,
    Object? efficiency = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? relatedHolidays = null,
  }) {
    return _then(
      _$BridgeDayRecommendationImpl(
        bridgeDays: null == bridgeDays
            ? _value._bridgeDays
            : bridgeDays // ignore: cast_nullable_to_non_nullable
                  as List<DateTime>,
        vacationDaysNeeded: null == vacationDaysNeeded
            ? _value.vacationDaysNeeded
            : vacationDaysNeeded // ignore: cast_nullable_to_non_nullable
                  as int,
        totalDaysOff: null == totalDaysOff
            ? _value.totalDaysOff
            : totalDaysOff // ignore: cast_nullable_to_non_nullable
                  as int,
        efficiency: null == efficiency
            ? _value.efficiency
            : efficiency // ignore: cast_nullable_to_non_nullable
                  as double,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endDate: null == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        relatedHolidays: null == relatedHolidays
            ? _value._relatedHolidays
            : relatedHolidays // ignore: cast_nullable_to_non_nullable
                  as List<Holiday>,
      ),
    );
  }
}

/// @nodoc

class _$BridgeDayRecommendationImpl extends _BridgeDayRecommendation {
  const _$BridgeDayRecommendationImpl({
    required final List<DateTime> bridgeDays,
    required this.vacationDaysNeeded,
    required this.totalDaysOff,
    required this.efficiency,
    required this.startDate,
    required this.endDate,
    required final List<Holiday> relatedHolidays,
  }) : _bridgeDays = bridgeDays,
       _relatedHolidays = relatedHolidays,
       super._();

  final List<DateTime> _bridgeDays;
  @override
  List<DateTime> get bridgeDays {
    if (_bridgeDays is EqualUnmodifiableListView) return _bridgeDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bridgeDays);
  }

  @override
  final int vacationDaysNeeded;
  @override
  final int totalDaysOff;
  @override
  final double efficiency;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  final List<Holiday> _relatedHolidays;
  @override
  List<Holiday> get relatedHolidays {
    if (_relatedHolidays is EqualUnmodifiableListView) return _relatedHolidays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedHolidays);
  }

  @override
  String toString() {
    return 'BridgeDayRecommendation(bridgeDays: $bridgeDays, vacationDaysNeeded: $vacationDaysNeeded, totalDaysOff: $totalDaysOff, efficiency: $efficiency, startDate: $startDate, endDate: $endDate, relatedHolidays: $relatedHolidays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BridgeDayRecommendationImpl &&
            const DeepCollectionEquality().equals(
              other._bridgeDays,
              _bridgeDays,
            ) &&
            (identical(other.vacationDaysNeeded, vacationDaysNeeded) ||
                other.vacationDaysNeeded == vacationDaysNeeded) &&
            (identical(other.totalDaysOff, totalDaysOff) ||
                other.totalDaysOff == totalDaysOff) &&
            (identical(other.efficiency, efficiency) ||
                other.efficiency == efficiency) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality().equals(
              other._relatedHolidays,
              _relatedHolidays,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_bridgeDays),
    vacationDaysNeeded,
    totalDaysOff,
    efficiency,
    startDate,
    endDate,
    const DeepCollectionEquality().hash(_relatedHolidays),
  );

  /// Create a copy of BridgeDayRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BridgeDayRecommendationImplCopyWith<_$BridgeDayRecommendationImpl>
  get copyWith =>
      __$$BridgeDayRecommendationImplCopyWithImpl<
        _$BridgeDayRecommendationImpl
      >(this, _$identity);
}

abstract class _BridgeDayRecommendation extends BridgeDayRecommendation {
  const factory _BridgeDayRecommendation({
    required final List<DateTime> bridgeDays,
    required final int vacationDaysNeeded,
    required final int totalDaysOff,
    required final double efficiency,
    required final DateTime startDate,
    required final DateTime endDate,
    required final List<Holiday> relatedHolidays,
  }) = _$BridgeDayRecommendationImpl;
  const _BridgeDayRecommendation._() : super._();

  @override
  List<DateTime> get bridgeDays;
  @override
  int get vacationDaysNeeded;
  @override
  int get totalDaysOff;
  @override
  double get efficiency;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  List<Holiday> get relatedHolidays;

  /// Create a copy of BridgeDayRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BridgeDayRecommendationImplCopyWith<_$BridgeDayRecommendationImpl>
  get copyWith => throw _privateConstructorUsedError;
}
