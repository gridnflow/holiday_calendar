import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:holiday_calendar/app.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    initializeDateFormatting('de_DE', null),
    MobileAds.instance.initialize(),
  ]);

  runApp(
    const ProviderScope(
      child: HolidayCalendarApp(),
    ),
  );
}
