// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'federal_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FederalState {
  String get code => throw _privateConstructorUsedError;
  String get nameDE => throw _privateConstructorUsedError;
  String get nameEN => throw _privateConstructorUsedError;

  /// Create a copy of FederalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FederalStateCopyWith<FederalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FederalStateCopyWith<$Res> {
  factory $FederalStateCopyWith(
    FederalState value,
    $Res Function(FederalState) then,
  ) = _$FederalStateCopyWithImpl<$Res, FederalState>;
  @useResult
  $Res call({String code, String nameDE, String nameEN});
}

/// @nodoc
class _$FederalStateCopyWithImpl<$Res, $Val extends FederalState>
    implements $FederalStateCopyWith<$Res> {
  _$FederalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FederalState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? nameDE = null,
    Object? nameEN = null,
  }) {
    return _then(
      _value.copyWith(
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            nameDE: null == nameDE
                ? _value.nameDE
                : nameDE // ignore: cast_nullable_to_non_nullable
                      as String,
            nameEN: null == nameEN
                ? _value.nameEN
                : nameEN // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FederalStateImplCopyWith<$Res>
    implements $FederalStateCopyWith<$Res> {
  factory _$$FederalStateImplCopyWith(
    _$FederalStateImpl value,
    $Res Function(_$FederalStateImpl) then,
  ) = __$$FederalStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String nameDE, String nameEN});
}

/// @nodoc
class __$$FederalStateImplCopyWithImpl<$Res>
    extends _$FederalStateCopyWithImpl<$Res, _$FederalStateImpl>
    implements _$$FederalStateImplCopyWith<$Res> {
  __$$FederalStateImplCopyWithImpl(
    _$FederalStateImpl _value,
    $Res Function(_$FederalStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FederalState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? nameDE = null,
    Object? nameEN = null,
  }) {
    return _then(
      _$FederalStateImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        nameDE: null == nameDE
            ? _value.nameDE
            : nameDE // ignore: cast_nullable_to_non_nullable
                  as String,
        nameEN: null == nameEN
            ? _value.nameEN
            : nameEN // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$FederalStateImpl implements _FederalState {
  const _$FederalStateImpl({
    required this.code,
    required this.nameDE,
    required this.nameEN,
  });

  @override
  final String code;
  @override
  final String nameDE;
  @override
  final String nameEN;

  @override
  String toString() {
    return 'FederalState(code: $code, nameDE: $nameDE, nameEN: $nameEN)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FederalStateImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.nameDE, nameDE) || other.nameDE == nameDE) &&
            (identical(other.nameEN, nameEN) || other.nameEN == nameEN));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, nameDE, nameEN);

  /// Create a copy of FederalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FederalStateImplCopyWith<_$FederalStateImpl> get copyWith =>
      __$$FederalStateImplCopyWithImpl<_$FederalStateImpl>(this, _$identity);
}

abstract class _FederalState implements FederalState {
  const factory _FederalState({
    required final String code,
    required final String nameDE,
    required final String nameEN,
  }) = _$FederalStateImpl;

  @override
  String get code;
  @override
  String get nameDE;
  @override
  String get nameEN;

  /// Create a copy of FederalState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FederalStateImplCopyWith<_$FederalStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
