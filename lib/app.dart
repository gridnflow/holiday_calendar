import 'package:flutter/material.dart';
import 'package:holiday_calendar/core/theme/app_theme.dart';
import 'package:holiday_calendar/presentation/screens/home_screen.dart';

class HolidayCalendarApp extends StatelessWidget {
  const HolidayCalendarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feiertage Deutschland',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
