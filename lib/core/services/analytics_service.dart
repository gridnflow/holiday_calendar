import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  static final AnalyticsService _instance = AnalyticsService._internal();
  factory AnalyticsService() => _instance;
  AnalyticsService._internal();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver get observer =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  void logOnboardingCompleted({
    required String bundesland,
    required bool notificationsEnabled,
    required int vacationDays,
  }) {
    _analytics.logEvent(
      name: 'onboarding_completed',
      parameters: {
        'bundesland': bundesland,
        'notifications_enabled': notificationsEnabled.toString(),
        'vacation_days': vacationDays,
      },
    );
  }

  void logBundeslandSelected(String bundeslandCode) {
    _analytics.logEvent(
      name: 'bundesland_selected',
      parameters: {'bundesland_code': bundeslandCode},
    );
  }

  void logBridgeDayViewed({
    required int vacationDays,
    required int totalDaysOff,
    required String holidayName,
  }) {
    _analytics.logEvent(
      name: 'bridge_day_viewed',
      parameters: {
        'vacation_days': vacationDays,
        'total_days_off': totalDaysOff,
        'holiday_name': holidayName,
      },
    );
  }

  void logNotificationToggled(bool enabled) {
    _analytics.logEvent(
      name: 'notification_toggled',
      parameters: {'enabled': enabled.toString()},
    );
  }

  void logCalendarExport(String format) {
    _analytics.logEvent(
      name: 'calendar_export',
      parameters: {'format': format},
    );
  }

  void logScreenView(String screenName) {
    _analytics.logScreenView(screenName: screenName);
  }
}
