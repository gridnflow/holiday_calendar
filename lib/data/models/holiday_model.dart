import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';

part 'holiday_model.freezed.dart';
part 'holiday_model.g.dart';

@freezed
class HolidayModel with _$HolidayModel {
  const factory HolidayModel({
    required String date,
    required String localName,
    required String name,
    required String countryCode,
    required bool fixed,
    required bool global,
    List<String>? counties,
    List<String>? types,
  }) = _HolidayModel;

  const HolidayModel._();

  factory HolidayModel.fromJson(Map<String, dynamic> json) =>
      _$HolidayModelFromJson(json);

  Holiday toEntity() {
    return Holiday(
      date: DateTime.parse(date),
      localName: localName,
      name: name,
      countryCode: countryCode,
      fixed: fixed,
      global: global,
      counties: counties,
      types: types,
    );
  }
}
