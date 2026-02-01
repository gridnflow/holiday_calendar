// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'German Public Holidays';

  @override
  String get holidays => 'Holidays';

  @override
  String get bridgeDays => 'Bridge Days';

  @override
  String get allStates => 'All Federal States';

  @override
  String get state => 'Federal State';

  @override
  String get year => 'Year';

  @override
  String get month => 'Month';

  @override
  String get refresh => 'Refresh';

  @override
  String get retry => 'Try again';

  @override
  String get errorOccurred => 'Error occurred';

  @override
  String get noHolidaysFound => 'No holidays found';

  @override
  String get noBridgeDaysFound => 'No bridge days found';

  @override
  String get vacationDays => 'Vacation days';

  @override
  String get daysOff => 'Days off';

  @override
  String get efficiency => 'Efficiency';

  @override
  String get vacationRecommendation => 'Vacation recommendation';

  @override
  String get vacationDaysNeeded => 'Vacation days needed';

  @override
  String get totalDaysOff => 'Total days off';

  @override
  String get relatedHolidays => 'Related holidays';

  @override
  String get veryGood => 'Very good';

  @override
  String get good => 'Good';

  @override
  String get okay => 'Okay';

  @override
  String get low => 'Low';

  @override
  String get january => 'January';

  @override
  String get february => 'February';

  @override
  String get march => 'March';

  @override
  String get april => 'April';

  @override
  String get may => 'May';

  @override
  String get june => 'June';

  @override
  String get july => 'July';

  @override
  String get august => 'August';

  @override
  String get september => 'September';

  @override
  String get october => 'October';

  @override
  String get november => 'November';

  @override
  String get december => 'December';

  @override
  String bridgeDayLabel(int days, int total) {
    return '$days vacation days → $total days off';
  }
}
