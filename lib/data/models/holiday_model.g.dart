// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holiday_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HolidayModelImpl _$$HolidayModelImplFromJson(Map<String, dynamic> json) =>
    _$HolidayModelImpl(
      date: json['date'] as String,
      localName: json['localName'] as String,
      name: json['name'] as String,
      countryCode: json['countryCode'] as String,
      fixed: json['fixed'] as bool,
      global: json['global'] as bool,
      counties: (json['counties'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$HolidayModelImplToJson(_$HolidayModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'localName': instance.localName,
      'name': instance.name,
      'countryCode': instance.countryCode,
      'fixed': instance.fixed,
      'global': instance.global,
      'counties': instance.counties,
      'types': instance.types,
    };
