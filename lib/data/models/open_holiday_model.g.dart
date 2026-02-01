// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_holiday_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OpenHolidayModelImpl _$$OpenHolidayModelImplFromJson(
  Map<String, dynamic> json,
) => _$OpenHolidayModelImpl(
  id: json['id'] as String,
  startDate: json['startDate'] as String,
  endDate: json['endDate'] as String,
  type: json['type'] as String,
  name: (json['name'] as List<dynamic>)
      .map((e) => LocalizedText.fromJson(e as Map<String, dynamic>))
      .toList(),
  nationwide: json['nationwide'] as bool,
  subdivisions: (json['subdivisions'] as List<dynamic>?)
      ?.map((e) => Subdivision.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$OpenHolidayModelImplToJson(
  _$OpenHolidayModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'startDate': instance.startDate,
  'endDate': instance.endDate,
  'type': instance.type,
  'name': instance.name,
  'nationwide': instance.nationwide,
  'subdivisions': instance.subdivisions,
};

_$LocalizedTextImpl _$$LocalizedTextImplFromJson(Map<String, dynamic> json) =>
    _$LocalizedTextImpl(
      language: json['language'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$$LocalizedTextImplToJson(_$LocalizedTextImpl instance) =>
    <String, dynamic>{'language': instance.language, 'text': instance.text};

_$SubdivisionImpl _$$SubdivisionImplFromJson(Map<String, dynamic> json) =>
    _$SubdivisionImpl(
      code: json['code'] as String,
      shortName: json['shortName'] as String,
    );

Map<String, dynamic> _$$SubdivisionImplToJson(_$SubdivisionImpl instance) =>
    <String, dynamic>{'code': instance.code, 'shortName': instance.shortName};
