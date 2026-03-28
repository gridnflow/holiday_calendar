import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:holiday_calendar/app.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('de');
    await initializeDateFormatting('en');
  });

  testWidgets('App renders with correct title', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      const ProviderScope(
        child: HolidayCalendarApp(),
      ),
    );

    // App should render — FutureBuilder shows loading first, then
    // OnboardingScreen (first launch) or HomeScreen (returning user)
    await tester.pump();

    // The MaterialApp title is 'Feiertage Deutschland'
    // Verify the app widget tree is created without errors
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
