import 'package:flutter/services.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WidgetService {
  static const _channel = MethodChannel('com.example.holiday_calendar/widget');

  static const _nameKey = 'widget_next_holiday_name';
  static const _dateKey = 'widget_next_holiday_date';
  static const _daysKey = 'widget_next_holiday_days';

  static Future<void> updateNextHoliday(List<Holiday> holidays) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final upcoming = holidays
        .where((h) => !DateTime(h.date.year, h.date.month, h.date.day).isBefore(today))
        .toList()
      ..sort((a, b) => a.date.compareTo(b.date));

    final prefs = await SharedPreferences.getInstance();

    if (upcoming.isEmpty) {
      await prefs.setString(_nameKey, 'Kein Feiertag');
      await prefs.setString(_dateKey, '—');
      await prefs.setInt(_daysKey, -1);
    } else {
      final next = upcoming.first;
      final nextDate = DateTime(next.date.year, next.date.month, next.date.day);
      final days = nextDate.difference(today).inDays;

      await prefs.setString(_nameKey, next.localName);
      await prefs.setString(_dateKey, _formatDate(next.date));
      await prefs.setInt(_daysKey, days);
    }

    try {
      await _channel.invokeMethod('updateWidget');
    } catch (_) {}
  }

  static String _formatDate(DateTime date) {
    const months = [
      'Jan', 'Feb', 'Mär', 'Apr', 'Mai', 'Jun',
      'Jul', 'Aug', 'Sep', 'Okt', 'Nov', 'Dez',
    ];
    return '${date.day}. ${months[date.month - 1]}';
  }
}
