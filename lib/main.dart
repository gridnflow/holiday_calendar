import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:holiday_calendar/app.dart';
import 'package:holiday_calendar/core/constants/ad_constants.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize date formatting
  await initializeDateFormatting('de_DE', null);

  // Initialize Mobile Ads (only on supported platforms)
  if (AdConstants.isAdSupported) {
    try {
      await MobileAds.instance.initialize();
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Failed to initialize MobileAds: $e');
      }
    }
  }

  runApp(const ProviderScope(child: HolidayCalendarApp()));
}
