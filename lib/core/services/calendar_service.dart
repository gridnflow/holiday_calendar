import 'package:flutter/services.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';

class CalendarService {
  CalendarService._();

  static const _channel = MethodChannel('com.gridnflow.feiertage.kalender/calendar');

  /// Add a single holiday to device calendar via Android CalendarContract Intent
  static Future<void> addHolidayToCalendar(Holiday holiday) async {
    try {
      await _channel.invokeMethod('addEvent', {
        'title': holiday.localName,
        'beginMs': DateTime(holiday.date.year, holiday.date.month, holiday.date.day)
            .millisecondsSinceEpoch,
        'endMs': DateTime(holiday.date.year, holiday.date.month, holiday.date.day)
            .millisecondsSinceEpoch,
        'allDay': true,
        'description': 'Gesetzlicher Feiertag in Deutschland',
      });
    } catch (_) {}
  }

  /// Add all holidays to device calendar
  static Future<void> addAllHolidaysToCalendar(List<Holiday> holidays) async {
    for (final holiday in holidays) {
      await addHolidayToCalendar(holiday);
    }
  }
}
