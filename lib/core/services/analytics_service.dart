import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AnalyticsService {
  static final AnalyticsService _instance = AnalyticsService._internal();
  factory AnalyticsService() => _instance;
  AnalyticsService._internal();

  /// Lazily resolved so constructing the service (e.g. for the navigator
  /// observer) never touches Firebase before [Firebase.initializeApp]. Null
  /// when Firebase is unavailable — as in widget tests — so nothing crashes.
  FirebaseAnalytics? _cachedAnalytics;
  bool _resolved = false;

  FirebaseAnalytics? get _analytics {
    if (!_resolved) {
      _resolved = true;
      try {
        _cachedAnalytics = FirebaseAnalytics.instance;
      } catch (e) {
        if (kDebugMode) debugPrint('FirebaseAnalytics unavailable: $e');
        _cachedAnalytics = null;
      }
    }
    return _cachedAnalytics;
  }

  /// A no-op observer is returned when analytics is unavailable so wiring it
  /// into [MaterialApp.navigatorObservers] is always safe.
  late final NavigatorObserver observer = _analytics == null
      ? NavigatorObserver()
      : FirebaseAnalyticsObserver(analytics: _analytics!);

  /// Fired once when the onboarding flow first appears. Pair with
  /// [logOnboardingStepViewed] and [logOnboardingCompleted] to build a
  /// drop-off funnel across the 3 onboarding pages.
  void logOnboardingStarted() {
    _analytics?.logEvent(name: 'onboarding_started');
  }

  /// Fired each time the user reaches an onboarding page (0-indexed step).
  /// The gap between step counts reveals exactly where users abandon.
  void logOnboardingStepViewed(int step) {
    _analytics?.logEvent(
      name: 'onboarding_step_viewed',
      parameters: {'step': step},
    );
  }

  /// Fired when the app is opened. `source` distinguishes a cold launch from
  /// a notification tap so re-engagement effectiveness is measurable.
  void logAppOpen({required String source}) {
    _analytics?.logEvent(
      name: 'app_open',
      parameters: {'source': source},
    );
  }

  /// Fired when a scheduled notification is tapped. `type` is the payload
  /// prefix (holiday_d7, holiday_d1, monthly_summary, brueckentag,
  /// onboarding_d1/d3/d7) so each re-engagement channel can be attributed.
  void logNotificationOpen({required String type}) {
    _analytics?.logEvent(
      name: 'notification_open',
      parameters: {'type': type},
    );
  }

  void logOnboardingCompleted({
    required String bundesland,
    required bool notificationsEnabled,
    required int vacationDays,
  }) {
    _analytics?.logEvent(
      name: 'onboarding_completed',
      parameters: {
        'bundesland': bundesland,
        'notifications_enabled': notificationsEnabled.toString(),
        'vacation_days': vacationDays,
      },
    );
  }

  void logBundeslandSelected(String bundeslandCode) {
    _analytics?.logEvent(
      name: 'bundesland_selected',
      parameters: {'bundesland_code': bundeslandCode},
    );
  }

  void logBridgeDayViewed({
    required int vacationDays,
    required int totalDaysOff,
    required String holidayName,
  }) {
    _analytics?.logEvent(
      name: 'bridge_day_viewed',
      parameters: {
        'vacation_days': vacationDays,
        'total_days_off': totalDaysOff,
        'holiday_name': holidayName,
      },
    );
  }

  void logNotificationToggled(bool enabled) {
    _analytics?.logEvent(
      name: 'notification_toggled',
      parameters: {'enabled': enabled.toString()},
    );
  }

  void logCalendarExport(String format) {
    _analytics?.logEvent(
      name: 'calendar_export',
      parameters: {'format': format},
    );
  }

  void logScreenView(String screenName) {
    _analytics?.logScreenView(screenName: screenName);
  }
}
