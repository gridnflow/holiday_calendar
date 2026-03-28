import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:holiday_calendar/core/services/notification_service.dart';
import 'package:holiday_calendar/core/theme/app_theme.dart';
import 'package:holiday_calendar/l10n/app_localizations.dart';
import 'package:holiday_calendar/presentation/screens/bridge_day_screen.dart';
import 'package:holiday_calendar/presentation/screens/home_screen.dart';
import 'package:holiday_calendar/presentation/screens/onboarding_screen.dart';

class HolidayCalendarApp extends StatelessWidget {
  const HolidayCalendarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feiertage Deutschland',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      navigatorKey: navigatorKey,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('de'),
        Locale('en'),
        Locale('ru'),
        Locale('tr'),
        Locale('ar'),
      ],
      routes: {
        '/bridge-days': (_) => const BridgeDayScreen(),
      },
      home: FutureBuilder<bool>(
        future: isOnboardingComplete(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return snapshot.data!
              ? const HomeScreen()
              : const OnboardingScreen();
        },
      ),
    );
  }
}
