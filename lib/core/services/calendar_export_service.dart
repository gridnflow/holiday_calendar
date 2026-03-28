import 'dart:io';

import 'package:holiday_calendar/core/services/analytics_service.dart';
import 'package:holiday_calendar/domain/entities/bridge_day.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CalendarExportService {
  static final _icsDateFormat = DateFormat('yyyyMMdd');

  /// Generate iCal content for a list of holidays
  static String generateHolidayIcs(List<Holiday> holidays) {
    final buffer = StringBuffer();
    buffer.writeln('BEGIN:VCALENDAR');
    buffer.writeln('VERSION:2.0');
    buffer.writeln('PRODID:-//Feiertage DE//Holiday Calendar//DE');
    buffer.writeln('CALSCALE:GREGORIAN');
    buffer.writeln('METHOD:PUBLISH');

    for (final holiday in holidays) {
      buffer.writeln('BEGIN:VEVENT');
      buffer.writeln('DTSTART;VALUE=DATE:${_icsDateFormat.format(holiday.date)}');
      buffer.writeln('DTEND;VALUE=DATE:${_icsDateFormat.format(holiday.date.add(const Duration(days: 1)))}');
      buffer.writeln('SUMMARY:${_escapeIcs(holiday.localName)}');
      buffer.writeln('DESCRIPTION:${_escapeIcs(holiday.name)} (${holiday.countryCode})');
      buffer.writeln('TRANSP:TRANSPARENT');
      buffer.writeln('END:VEVENT');
    }

    buffer.writeln('END:VCALENDAR');
    return buffer.toString();
  }

  /// Generate iCal content for a bridge day recommendation
  static String generateBridgeDayIcs(BridgeDayRecommendation recommendation) {
    final buffer = StringBuffer();
    buffer.writeln('BEGIN:VCALENDAR');
    buffer.writeln('VERSION:2.0');
    buffer.writeln('PRODID:-//Feiertage DE//Holiday Calendar//DE');
    buffer.writeln('CALSCALE:GREGORIAN');
    buffer.writeln('METHOD:PUBLISH');

    // Add the bridge day period as an event
    final holidayNames =
        recommendation.relatedHolidays.map((h) => h.localName).join(', ');
    buffer.writeln('BEGIN:VEVENT');
    buffer.writeln('DTSTART;VALUE=DATE:${_icsDateFormat.format(recommendation.startDate)}');
    buffer.writeln('DTEND;VALUE=DATE:${_icsDateFormat.format(recommendation.endDate.add(const Duration(days: 1)))}');
    buffer.writeln('SUMMARY:${_escapeIcs('Brückentage: $holidayNames')}');
    buffer.writeln('DESCRIPTION:${_escapeIcs(recommendation.label)}');
    buffer.writeln('END:VEVENT');

    // Add individual vacation days
    for (final bridgeDay in recommendation.bridgeDays) {
      buffer.writeln('BEGIN:VEVENT');
      buffer.writeln('DTSTART;VALUE=DATE:${_icsDateFormat.format(bridgeDay)}');
      buffer.writeln('DTEND;VALUE=DATE:${_icsDateFormat.format(bridgeDay.add(const Duration(days: 1)))}');
      buffer.writeln('SUMMARY:Urlaub (Brückentag)');
      buffer.writeln('TRANSP:OPAQUE');
      buffer.writeln('END:VEVENT');
    }

    buffer.writeln('END:VCALENDAR');
    return buffer.toString();
  }

  /// Export iCal content as a .ics file and open it with the system handler
  static Future<bool> exportToCalendar(String icsContent, String filename) async {
    try {
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/$filename.ics');
      await file.writeAsString(icsContent);

      final uri = Uri.file(file.path);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
        AnalyticsService().logCalendarExport('ics');
        return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  static String _escapeIcs(String text) {
    return text
        .replaceAll('\\', '\\\\')
        .replaceAll(',', '\\,')
        .replaceAll(';', '\\;')
        .replaceAll('\n', '\\n');
  }
}
