import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:holiday_calendar/app.dart';
import 'package:holiday_calendar/core/constants/ad_constants.dart';
import 'package:holiday_calendar/core/services/notification_service.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize date formatting
  await initializeDateFormatting('de_DE', null);

  // Initialize notifications and ads in parallel
  await Future.wait([
    NotificationService().initialize().catchError((e) {
      if (kDebugMode) debugPrint('Failed to initialize NotificationService: $e');
    }),
    if (AdConstants.isAdSupported)
      MobileAds.instance.initialize().catchError((e) {
        if (kDebugMode) debugPrint('Failed to initialize MobileAds: $e');
      }),
  ]);

  runApp(const ProviderScope(child: HolidayCalendarApp()));
}
