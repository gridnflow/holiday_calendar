import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;

/// Global navigator key for notification deep linking
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  Future<void> initialize() async {
    if (_isInitialized) return;

    // Initialize timezone
    tz_data.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Europe/Berlin'));

    // Android settings
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');

    const initSettings = InitializationSettings(
      android: androidSettings,
    );

    await _notifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTap,
    );

    _isInitialized = true;
  }

  void _onNotificationTap(NotificationResponse response) {
    final payload = response.payload;
    if (kDebugMode) {
      debugPrint('Notification tapped: $payload');
    }
    // Deep link: navigate to the route registered in the app
    navigatorKey.currentState?.pushNamed('/bridge-days');
  }

  /// Request notification permissions (iOS/Android 13+)
  Future<bool> requestPermissions() async {
    final android = _notifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    bool granted = true;

    if (android != null) {
      granted = await android.requestNotificationsPermission() ?? false;
    }

    return granted;
  }

  /// Schedule a Brückentage reminder notification
  Future<void> scheduleBrueckentagReminder({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    String? payload,
  }) async {
    final androidDetails = AndroidNotificationDetails(
      'brueckentage_channel',
      'Brückentage Erinnerungen',
      channelDescription: 'Erinnerungen für Brückentage Urlaubsplanung',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );

    final details = NotificationDetails(
      android: androidDetails,
    );

    await _notifications.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      details,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: payload,
    );
  }

  // Onboarding notification IDs (reserved range: 9001-9003)
  static const int _onboardingD1Id = 9001;
  static const int _onboardingD3Id = 9002;
  static const int _onboardingD7Id = 9003;

  /// Schedule the onboarding notification sequence (D+1, D+3, D+7).
  /// Called after onboarding when the user opts in to notifications.
  Future<void> scheduleOnboardingSequence({
    required int daysUntilNextHoliday,
    required int remainingBridgeDays,
    required String nextHolidayDate,
    required String nextHolidayName,
    String? bundeslandName,
  }) async {
    final now = DateTime.now();

    // D+1: Encourage enabling reminders
    await scheduleBrueckentagReminder(
      id: _onboardingD1Id,
      title: 'Nächster Feiertag in $daysUntilNextHoliday Tagen!',
      body: 'Plane jetzt deine Brückentage und maximiere deinen Urlaub.',
      scheduledDate: now.add(const Duration(days: 1)),
      payload: 'onboarding_d1',
    );

    // D+3: Show remaining bridge days
    await scheduleBrueckentagReminder(
      id: _onboardingD3Id,
      title: 'Noch $remainingBridgeDays Brückentage in ${now.year}',
      body: 'Jetzt planen und das Beste aus deinem Urlaub herausholen!',
      scheduledDate: now.add(const Duration(days: 3)),
      payload: 'onboarding_d3',
    );

    // D+7: Specific next holiday info
    final locationPrefix =
        bundeslandName != null ? '$bundeslandName: ' : '';
    await scheduleBrueckentagReminder(
      id: _onboardingD7Id,
      title: '${locationPrefix}Nächster Feiertag',
      body: '$nextHolidayDate — $nextHolidayName. App öffnen für Brückentage-Tipps!',
      scheduledDate: now.add(const Duration(days: 7)),
      payload: 'onboarding_d7',
    );
  }

  /// Cancel onboarding sequence notifications
  Future<void> cancelOnboardingSequence() async {
    await _notifications.cancel(_onboardingD1Id);
    await _notifications.cancel(_onboardingD3Id);
    await _notifications.cancel(_onboardingD7Id);
  }

  /// Cancel a specific notification
  Future<void> cancelNotification(int id) async {
    await _notifications.cancel(id);
  }

  /// Cancel all notifications
  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
  }

  /// Get pending notifications
  Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    return await _notifications.pendingNotificationRequests();
  }

  /// Schedule D-7 and D-1 reminders for all upcoming holidays
  Future<void> scheduleHolidayReminders(List<Holiday> holidays) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('holiday_reminders_enabled') != true) return;

    // Cancel existing holiday reminders by checking pending notifications
    final pending = await _notifications.pendingNotificationRequests();
    for (final n in pending) {
      if (n.id >= 1000 && n.id < 2000) {
        await _notifications.cancel(n.id);
      }
    }

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    int idCounter = 1000;

    for (final holiday in holidays) {
      final holidayDate = DateTime(
        holiday.date.year,
        holiday.date.month,
        holiday.date.day,
      );
      final daysUntil = holidayDate.difference(today).inDays;

      // D-7: schedule notification for today at 9pm
      if (daysUntil == 7) {
        final scheduleTime = DateTime(now.year, now.month, now.day, 21, 0);
        if (scheduleTime.isAfter(now)) {
          await scheduleBrueckentagReminder(
            id: idCounter++,
            title: 'In 7 Tagen: ${holiday.localName}',
            body: 'Noch Zeit zum Planen! Schau dir die Brückentage an.',
            scheduledDate: scheduleTime,
            payload: 'holiday_d7',
          );
        }
      }

      // D-1: schedule notification for today at 6pm
      if (daysUntil == 1) {
        final scheduleTime = DateTime(now.year, now.month, now.day, 18, 0);
        if (scheduleTime.isAfter(now)) {
          await scheduleBrueckentagReminder(
            id: idCounter++,
            title: 'Morgen: ${holiday.localName} 🎉',
            body: 'Genieße deinen freien Tag!',
            scheduledDate: scheduleTime,
            payload: 'holiday_d1',
          );
        }
      }
    }
  }

  // Monthly summary notification ID (reserved: 8001)
  static const int _monthlySummaryId = 8001;

  /// Schedule monthly summary notification for the 1st of next month
  Future<void> scheduleMonthlyHolidaySummary({
    required int holidayCountThisMonth,
    required int maxDaysOff,
    required String monthName,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('monthly_summary_enabled') != true) return;

    // Cancel previous monthly summary
    await _notifications.cancel(_monthlySummaryId);

    final now = DateTime.now();
    // Schedule for 1st of next month at 9am
    final nextMonth = DateTime(now.year, now.month + 1, 1, 9, 0);

    if (holidayCountThisMonth == 0) return;

    await scheduleBrueckentagReminder(
      id: _monthlySummaryId,
      title: '$monthName: $holidayCountThisMonth Feiertag${holidayCountThisMonth > 1 ? 'e' : ''}',
      body: 'Mit Brückentagen bis zu $maxDaysOff Tage am Stück frei!',
      scheduledDate: nextMonth,
      payload: 'monthly_summary',
    );
  }

  /// Show immediate notification (for testing)
  Future<void> showTestNotification() async {
    const androidDetails = AndroidNotificationDetails(
      'test_channel',
      'Test Notifications',
      channelDescription: 'Test notifications for debugging',
      importance: Importance.high,
      priority: Priority.high,
    );

    const details = NotificationDetails(
      android: androidDetails,
    );

    await _notifications.show(
      0,
      'Brückentage Tipp',
      'Nächste Woche: 2 Urlaubstage nehmen → 6 Tage frei!',
      details,
    );
  }
}
