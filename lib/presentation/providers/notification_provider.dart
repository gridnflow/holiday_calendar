import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/core/services/notification_service.dart';
import 'package:holiday_calendar/domain/entities/bridge_day.dart';
import 'package:holiday_calendar/presentation/providers/bridge_day_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'notification_provider.g.dart';

const String _brueckentagNotificationsKey = 'brueckentag_notifications_enabled';
const String _reminderDaysBeforeKey = 'reminder_days_before';

/// Notification settings with persistence
@riverpod
class NotificationSettings extends _$NotificationSettings {
  @override
  Future<NotificationSettingsData> build() async {
    final prefs = await SharedPreferences.getInstance();
    return NotificationSettingsData(
      brueckentagEnabled: prefs.getBool(_brueckentagNotificationsKey) ?? false,
      reminderDaysBefore: prefs.getInt(_reminderDaysBeforeKey) ?? 7,
    );
  }

  Future<void> setBrueckentagEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_brueckentagNotificationsKey, enabled);

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

  const NotificationSettingsData({
    required this.brueckentagEnabled,
    required this.reminderDaysBefore,
  });
}

/// Provider to check if notifications are supported
@riverpod
bool notificationsSupported(Ref ref) {
  // Notifications are supported on Android and iOS
  return true;
}
