import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/core/services/analytics_service.dart';
import 'package:holiday_calendar/core/services/notification_service.dart';
import 'package:holiday_calendar/domain/entities/bridge_day.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';
import 'package:holiday_calendar/presentation/providers/bridge_day_provider.dart';
import 'package:holiday_calendar/presentation/providers/holiday_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'notification_provider.g.dart';

const String _brueckentagNotificationsKey = 'brueckentag_notifications_enabled';
const String _reminderDaysBeforeKey = 'reminder_days_before';
const String _holidayRemindersKey = 'holiday_reminders_enabled';
const String _monthlySummaryKey = 'monthly_summary_enabled';

/// Notification settings with persistence
@riverpod
class NotificationSettings extends _$NotificationSettings {
  @override
  Future<NotificationSettingsData> build() async {
    final prefs = await SharedPreferences.getInstance();
    return NotificationSettingsData(
      brueckentagEnabled: prefs.getBool(_brueckentagNotificationsKey) ?? false,
      reminderDaysBefore: prefs.getInt(_reminderDaysBeforeKey) ?? 7,
      holidayRemindersEnabled: prefs.getBool(_holidayRemindersKey) ?? false,
      monthlySummaryEnabled: prefs.getBool(_monthlySummaryKey) ?? true,
    );
  }

  Future<void> setBrueckentagEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_brueckentagNotificationsKey, enabled);
    AnalyticsService().logNotificationToggled(enabled);

    if (enabled) {
      // Request permissions and schedule notifications
      final service = NotificationService();
      final granted = await service.requestPermissions();
      if (granted) {
        await _scheduleAllBrueckentagNotifications();
      }
    } else {
      // Cancel all notifications
      await NotificationService().cancelAllNotifications();
    }

    ref.invalidateSelf();
  }

  Future<void> setHolidayRemindersEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_holidayRemindersKey, enabled);

    final service = NotificationService();
    if (enabled) {
      await service.requestPermissions();
    }
    // scheduleHolidayReminders self-gates on the flag we just wrote and
    // cancels its own ID range when disabled, so call it either way.
    await service.scheduleHolidayReminders(_currentHolidays());

    ref.invalidateSelf();
  }

  Future<void> setMonthlySummaryEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_monthlySummaryKey, enabled);

    final service = NotificationService();
    if (enabled) {
      await service.requestPermissions();
    }
    // scheduleMonthlyHolidaySummary self-gates on the flag and cancels its
    // own ID range when disabled, so call it either way.
    await service.scheduleMonthlyHolidaySummary(_currentHolidays());

    ref.invalidateSelf();
  }

  /// Current holiday list (empty if not yet loaded). The schedulers treat an
  /// empty list as a no-op; the home screen reschedules once data arrives.
  List<Holiday> _currentHolidays() =>
      ref.read(holidayNotifierProvider).valueOrNull ?? const [];

  Future<void> setReminderDaysBefore(int days) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_reminderDaysBeforeKey, days);

    // Reschedule notifications with new timing
    final currentSettings = await future;
    if (currentSettings.brueckentagEnabled) {
      await _scheduleAllBrueckentagNotifications();
    }

    ref.invalidateSelf();
  }

  Future<void> _scheduleAllBrueckentagNotifications() async {
    final service = NotificationService();
    await service.cancelAllNotifications();

    final recommendations = ref.read(bridgeDayRecommendationsProvider);
    final settings = await future;

    int notificationId = 100;

    for (final rec in recommendations) {
      // Schedule notification X days before the bridge day period starts
      final notifyDate = rec.startDate.subtract(
        Duration(days: settings.reminderDaysBefore),
      );

      // Only schedule if the notification date is in the future
      if (notifyDate.isAfter(DateTime.now())) {
        await service.scheduleBrueckentagReminder(
          id: notificationId++,
          title: 'Brückentage Tipp 🏖️',
          body: _buildNotificationBody(rec),
          scheduledDate: notifyDate,
          payload: 'brueckentag_${rec.startDate.toIso8601String()}',
        );
      }
    }
  }

  String _buildNotificationBody(BridgeDayRecommendation rec) {
    final holidayNames = rec.relatedHolidays.map((h) => h.localName).join(', ');
    return '${rec.vacationDaysNeeded} Urlaubstage → ${rec.totalDaysOff} Tage frei! ($holidayNames)';
  }
}

/// Notification settings data model
class NotificationSettingsData {
  final bool brueckentagEnabled;
  final int reminderDaysBefore;
  final bool holidayRemindersEnabled;
  final bool monthlySummaryEnabled;

  const NotificationSettingsData({
    required this.brueckentagEnabled,
    required this.reminderDaysBefore,
    required this.holidayRemindersEnabled,
    required this.monthlySummaryEnabled,
  });
}

/// Provider to check if notifications are supported
@riverpod
bool notificationsSupported(Ref ref) {
  // Notifications are supported on Android
  return true;
}
