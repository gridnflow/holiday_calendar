import 'package:flutter/foundation.dart';

/// Analytics service abstraction.
///
/// Currently logs events to debug console. Once Firebase is configured
/// (google-services.json + GoogleService-Info.plist + firebase_options.dart),
/// replace the implementation with FirebaseAnalytics calls.
///
/// Setup steps:
/// 1. Run `flutterfire configure` to generate firebase_options.dart
/// 2. Add `firebase_core` and `firebase_analytics` to pubspec.yaml
/// 3. Call `Firebase.initializeApp()` in main.dart
/// 4. Replace `_logEvent` with `FirebaseAnalytics.instance.logEvent()`
class AnalyticsService {
  static final AnalyticsService _instance = AnalyticsService._internal();
  factory AnalyticsService() => _instance;
  AnalyticsService._internal();

  void _logEvent(String name, [Map<String, Object>? parameters]) {
    if (kDebugMode) {
      debugPrint('[Analytics] $name ${parameters ?? ''}');
    }
    // TODO: Replace with FirebaseAnalytics.instance.logEvent(
    //   name: name,
    //   parameters: parameters,
    // );
  }

  /// Onboarding completed
  void logOnboardingCompleted({
    required String bundesland,
    required bool notificationsEnabled,
    required int vacationDays,
  }) {
    _logEvent('onboarding_completed', {
      'bundesland': bundesland,
      'notifications_enabled': notificationsEnabled.toString(),
      'vacation_days': vacationDays,
    });
  }

  /// Bundesland selected (from onboarding or filter bar)
  void logBundeslandSelected(String bundeslandCode) {
    _logEvent('bundesland_selected', {
      'bundesland_code': bundeslandCode,
    });
  }

  /// Bridge day detail viewed
  void logBridgeDayViewed({
    required int vacationDays,
    required int totalDaysOff,
    required String holidayName,
  }) {
    _logEvent('bridge_day_viewed', {
      'vacation_days': vacationDays,
      'total_days_off': totalDaysOff,
      'holiday_name': holidayName,
    });
  }

  /// Notification enabled/disabled
  void logNotificationToggled(bool enabled) {
    _logEvent('notification_toggled', {
      'enabled': enabled.toString(),
    });
  }

  /// Calendar export triggered
  void logCalendarExport(String format) {
    _logEvent('calendar_export', {
      'format': format,
    });
  }

  /// Screen view
  void logScreenView(String screenName) {
    _logEvent('screen_view', {
      'screen_name': screenName,
    });
  }
}
