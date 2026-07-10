import 'package:flutter/services.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WidgetService {
  static const _channel = MethodChannel('com.gridnflow.feiertage.kalender/widget');

  static const _nameKey = 'widget_next_holiday_name';
  static const _dateKey = 'widget_next_holiday_date';
  static const _daysKey = 'widget_next_holiday_days';

  /// ISO `yyyy-MM-dd` of the next holiday. The native widget recomputes the
  /// D-day from THIS against the current date on every `onUpdate`, so the
  /// countdown keeps decreasing even when the app is never reopened.
  static const _isoDateKey = 'widget_next_holiday_iso';

  static Future<void> updateNextHoliday(List<Holiday> holidays) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final upcoming = holidays
        .where((h) => !DateTime(h.date.year, h.date.month, h.date.day).isBefore(today))
        .toList()
      ..sort((a, b) => a.date.compareTo(b.date));

    final prefs = await SharedPreferences.getInstance();

    String name;
    String date;
    String isoDate;
    int days;

    if (upcoming.isEmpty) {
      name = 'Kein Feiertag';
      date = '—';
      isoDate = '';
      days = -1;
    } else {
      final next = upcoming.first;
      final nextDate = DateTime(next.date.year, next.date.month, next.date.day);
      name = next.localName;
      date = _formatDate(next.date);
      isoDate = _formatIso(nextDate);
      days = nextDate.difference(today).inDays;
    }

    // Save to SharedPreferences (used by Android widget)
    await prefs.setString(_nameKey, name);
    await prefs.setString(_dateKey, date);
    await prefs.setString(_isoDateKey, isoDate);
    await prefs.setInt(_daysKey, days);

    // Notify native side to update widget
    try {
      await _channel.invokeMethod('updateWidget');
    } catch (_) {}
  }

  /// `yyyy-MM-dd`, parsed by the native widget to recompute the countdown.
  static String _formatIso(DateTime date) {
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    return '${date.year}-$m-$d';
  }

  static String _formatDate(DateTime date) {
    const months = [
      'Jan', 'Feb', 'Mär', 'Apr', 'Mai', 'Jun',
      'Jul', 'Aug', 'Sep', 'Okt', 'Nov', 'Dez',
    ];
    return '${date.day}. ${months[date.month - 1]}';
  }
}
