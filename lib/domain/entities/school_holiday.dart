import 'package:freezed_annotation/freezed_annotation.dart';

part 'school_holiday.freezed.dart';

@freezed
class SchoolHoliday with _$SchoolHoliday {
  const factory SchoolHoliday({
    required DateTime startDate,
    required DateTime endDate,
    required String localName,
    required String name,
    required String subdivisionCode,
  }) = _SchoolHoliday;

  const SchoolHoliday._();

  /// Check if a given date falls within this school holiday period
  bool containsDate(DateTime date) {
    final normalizedDate = DateTime(date.year, date.month, date.day);
    final normalizedStart = DateTime(startDate.year, startDate.month, startDate.day);
    final normalizedEnd = DateTime(endDate.year, endDate.month, endDate.day);
    return !normalizedDate.isBefore(normalizedStart) &&
        !normalizedDate.isAfter(normalizedEnd);
  }

  /// Duration in days (inclusive)
  int get durationDays =>
      endDate.difference(startDate).inDays + 1;
}
