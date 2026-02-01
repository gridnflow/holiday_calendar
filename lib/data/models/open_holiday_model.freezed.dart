// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_holiday_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OpenHolidayModel _$OpenHolidayModelFromJson(Map<String, dynamic> json) {
  return _OpenHolidayModel.fromJson(json);
}

/// @nodoc
mixin _$OpenHolidayModel {
  String get id => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<LocalizedText> get name => throw _privateConstructorUsedError;
  bool get nationwide => throw _privateConstructorUsedError;
  List<Subdivision>? get subdivisions => throw _privateConstructorUsedError;

  /// Serializes this OpenHolidayModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenHolidayModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenHolidayModelCopyWith<OpenHolidayModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenHolidayModelCopyWith<$Res> {
  factory $OpenHolidayModelCopyWith(
    OpenHolidayModel value,
    $Res Function(OpenHolidayModel) then,
  ) = _$OpenHolidayModelCopyWithImpl<$Res, OpenHolidayModel>;
  @useResult
  $Res call({
    String id,
    String startDate,
    String endDate,
    String type,
    List<LocalizedText> name,
    bool nationwide,
    List<Subdivision>? subdivisions,
  });
}

/// @nodoc
class _$OpenHolidayModelCopyWithImpl<$Res, $Val extends OpenHolidayModel>
    implements $OpenHolidayModelCopyWith<$Res> {
  _$OpenHolidayModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenHolidayModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? type = null,
    Object? name = null,
    Object? nationwide = null,
    Object? subdivisions = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as String,
            endDate: null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as List<LocalizedText>,
            nationwide: null == nationwide
                ? _value.nationwide
                : nationwide // ignore: cast_nullable_to_non_nullable
                      as bool,
            subdivisions: freezed == subdivisions
                ? _value.subdivisions
                : subdivisions // ignore: cast_nullable_to_non_nullable
                      as List<Subdivision>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OpenHolidayModelImplCopyWith<$Res>
    implements $OpenHolidayModelCopyWith<$Res> {
  factory _$$OpenHolidayModelImplCopyWith(
    _$OpenHolidayModelImpl value,
    $Res Function(_$OpenHolidayModelImpl) then,
  ) = __$$OpenHolidayModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String startDate,
    String endDate,
    String type,
    List<LocalizedText> name,
    bool nationwide,
    List<Subdivision>? subdivisions,
  });
}

/// @nodoc
class __$$OpenHolidayModelImplCopyWithImpl<$Res>
    extends _$OpenHolidayModelCopyWithImpl<$Res, _$OpenHolidayModelImpl>
    implements _$$OpenHolidayModelImplCopyWith<$Res> {
  __$$OpenHolidayModelImplCopyWithImpl(
    _$OpenHolidayModelImpl _value,
    $Res Function(_$OpenHolidayModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenHolidayModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? type = null,
    Object? name = null,
    Object? nationwide = null,
    Object? subdivisions = freezed,
  }) {
    return _then(
      _$OpenHolidayModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as String,
        endDate: null == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value._name
            : name // ignore: cast_nullable_to_non_nullable
                  as List<LocalizedText>,
        nationwide: null == nationwide
            ? _value.nationwide
            : nationwide // ignore: cast_nullable_to_non_nullable
                  as bool,
        subdivisions: freezed == subdivisions
            ? _value._subdivisions
            : subdivisions // ignore: cast_nullable_to_non_nullable
                  as List<Subdivision>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenHolidayModelImpl extends _OpenHolidayModel {
  const _$OpenHolidayModelImpl({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.type,
    required final List<LocalizedText> name,
    required this.nationwide,
    final List<Subdivision>? subdivisions,
  }) : _name = name,
       _subdivisions = subdivisions,
       super._();

  factory _$OpenHolidayModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenHolidayModelImplFromJson(json);

  @override
  final String id;
  @override
  final String startDate;
  @override
  final String endDate;
  @override
  final String type;
  final List<LocalizedText> _name;
  @override
  List<LocalizedText> get name {
    if (_name is EqualUnmodifiableListView) return _name;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_name);
  }

  @override
  final bool nationwide;
  final List<Subdivision>? _subdivisions;
  @override
  List<Subdivision>? get subdivisions {
    final value = _subdivisions;
    if (value == null) return null;
    if (_subdivisions is EqualUnmodifiableListView) return _subdivisions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OpenHolidayModel(id: $id, startDate: $startDate, endDate: $endDate, type: $type, name: $name, nationwide: $nationwide, subdivisions: $subdivisions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenHolidayModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._name, _name) &&
            (identical(other.nationwide, nationwide) ||
                other.nationwide == nationwide) &&
            const DeepCollectionEquality().equals(
              other._subdivisions,
              _subdivisions,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    startDate,
    endDate,
    type,
    const DeepCollectionEquality().hash(_name),
    nationwide,
    const DeepCollectionEquality().hash(_subdivisions),
  );

  /// Create a copy of OpenHolidayModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenHolidayModelImplCopyWith<_$OpenHolidayModelImpl> get copyWith =>
      __$$OpenHolidayModelImplCopyWithImpl<_$OpenHolidayModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenHolidayModelImplToJson(this);
  }
}

abstract class _OpenHolidayModel extends OpenHolidayModel {
  const factory _OpenHolidayModel({
    required final String id,
    required final String startDate,
    required final String endDate,
    required final String type,
    required final List<LocalizedText> name,
    required final bool nationwide,
    final List<Subdivision>? subdivisions,
  }) = _$OpenHolidayModelImpl;
  const _OpenHolidayModel._() : super._();

  factory _OpenHolidayModel.fromJson(Map<String, dynamic> json) =
      _$OpenHolidayModelImpl.fromJson;

  @override
  String get id;
  @override
  String get startDate;
  @override
  String get endDate;
  @override
  String get type;
  @override
  List<LocalizedText> get name;
  @override
  bool get nationwide;
  @override
  List<Subdivision>? get subdivisions;

  /// Create a copy of OpenHolidayModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenHolidayModelImplCopyWith<_$OpenHolidayModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocalizedText _$LocalizedTextFromJson(Map<String, dynamic> json) {
  return _LocalizedText.fromJson(json);
}

/// @nodoc
mixin _$LocalizedText {
  String get language => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  /// Serializes this LocalizedText to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocalizedText
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalizedTextCopyWith<LocalizedText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizedTextCopyWith<$Res> {
  factory $LocalizedTextCopyWith(
    LocalizedText value,
    $Res Function(LocalizedText) then,
  ) = _$LocalizedTextCopyWithImpl<$Res, LocalizedText>;
  @useResult
  $Res call({String language, String text});
}

/// @nodoc
class _$LocalizedTextCopyWithImpl<$Res, $Val extends LocalizedText>
    implements $LocalizedTextCopyWith<$Res> {
  _$LocalizedTextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocalizedText
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? language = null, Object? text = null}) {
    return _then(
      _value.copyWith(
            language: null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String,
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LocalizedTextImplCopyWith<$Res>
    implements $LocalizedTextCopyWith<$Res> {
  factory _$$LocalizedTextImplCopyWith(
    _$LocalizedTextImpl value,
    $Res Function(_$LocalizedTextImpl) then,
  ) = __$$LocalizedTextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String language, String text});
}

/// @nodoc
class __$$LocalizedTextImplCopyWithImpl<$Res>
    extends _$LocalizedTextCopyWithImpl<$Res, _$LocalizedTextImpl>
    implements _$$LocalizedTextImplCopyWith<$Res> {
  __$$LocalizedTextImplCopyWithImpl(
    _$LocalizedTextImpl _value,
    $Res Function(_$LocalizedTextImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocalizedText
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? language = null, Object? text = null}) {
    return _then(
      _$LocalizedTextImpl(
        language: null == language
            ? _value.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String,
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalizedTextImpl implements _LocalizedText {
  const _$LocalizedTextImpl({required this.language, required this.text});

  factory _$LocalizedTextImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalizedTextImplFromJson(json);

  @override
  final String language;
  @override
  final String text;

  @override
  String toString() {
    return 'LocalizedText(language: $language, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalizedTextImpl &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, language, text);

  /// Create a copy of LocalizedText
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalizedTextImplCopyWith<_$LocalizedTextImpl> get copyWith =>
      __$$LocalizedTextImplCopyWithImpl<_$LocalizedTextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalizedTextImplToJson(this);
  }
}

abstract class _LocalizedText implements LocalizedText {
  const factory _LocalizedText({
    required final String language,
    required final String text,
  }) = _$LocalizedTextImpl;

  factory _LocalizedText.fromJson(Map<String, dynamic> json) =
      _$LocalizedTextImpl.fromJson;

  @override
  String get language;
  @override
  String get text;

  /// Create a copy of LocalizedText
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalizedTextImplCopyWith<_$LocalizedTextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Subdivision _$SubdivisionFromJson(Map<String, dynamic> json) {
  return _Subdivision.fromJson(json);
}

/// @nodoc
mixin _$Subdivision {
  String get code => throw _privateConstructorUsedError;
  String get shortName => throw _privateConstructorUsedError;

  /// Serializes this Subdivision to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Subdivision
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubdivisionCopyWith<Subdivision> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubdivisionCopyWith<$Res> {
  factory $SubdivisionCopyWith(
    Subdivision value,
    $Res Function(Subdivision) then,
  ) = _$SubdivisionCopyWithImpl<$Res, Subdivision>;
  @useResult
  $Res call({String code, String shortName});
}

/// @nodoc
class _$SubdivisionCopyWithImpl<$Res, $Val extends Subdivision>
    implements $SubdivisionCopyWith<$Res> {
  _$SubdivisionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Subdivision
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? code = null, Object? shortName = null}) {
    return _then(
      _value.copyWith(
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            shortName: null == shortName
                ? _value.shortName
                : shortName // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubdivisionImplCopyWith<$Res>
    implements $SubdivisionCopyWith<$Res> {
  factory _$$SubdivisionImplCopyWith(
    _$SubdivisionImpl value,
    $Res Function(_$SubdivisionImpl) then,
  ) = __$$SubdivisionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String shortName});
}

/// @nodoc
class __$$SubdivisionImplCopyWithImpl<$Res>
    extends _$SubdivisionCopyWithImpl<$Res, _$SubdivisionImpl>
    implements _$$SubdivisionImplCopyWith<$Res> {
  __$$SubdivisionImplCopyWithImpl(
    _$SubdivisionImpl _value,
    $Res Function(_$SubdivisionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Subdivision
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? code = null, Object? shortName = null}) {
    return _then(
      _$SubdivisionImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        shortName: null == shortName
            ? _value.shortName
            : shortName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubdivisionImpl implements _Subdivision {
  const _$SubdivisionImpl({required this.code, required this.shortName});

  factory _$SubdivisionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubdivisionImplFromJson(json);

  @override
  final String code;
  @override
  final String shortName;

  @override
  String toString() {
    return 'Subdivision(code: $code, shortName: $shortName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubdivisionImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, shortName);

  /// Create a copy of Subdivision
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubdivisionImplCopyWith<_$SubdivisionImpl> get copyWith =>
      __$$SubdivisionImplCopyWithImpl<_$SubdivisionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubdivisionImplToJson(this);
  }
}

abstract class _Subdivision implements Subdivision {
  const factory _Subdivision({
    required final String code,
    required final String shortName,
  }) = _$SubdivisionImpl;

  factory _Subdivision.fromJson(Map<String, dynamic> json) =
      _$SubdivisionImpl.fromJson;

  @override
  String get code;
  @override
  String get shortName;

  /// Create a copy of Subdivision
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubdivisionImplCopyWith<_$SubdivisionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
