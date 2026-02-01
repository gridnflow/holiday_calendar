// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Feiertage Deutschland';

  @override
  String get holidays => 'Feiertage';

  @override
  String get bridgeDays => 'Brückentage';

  @override
  String get allStates => 'Alle Bundesländer';

  @override
  String get state => 'Bundesland';

  @override
  String get year => 'Jahr';

  @override
  String get month => 'Monat';

  @override
  String get refresh => 'Aktualisieren';

  @override
  String get retry => 'Erneut versuchen';

  @override
  String get errorOccurred => 'Fehler aufgetreten';

  @override
  String get noHolidaysFound => 'Keine Feiertage gefunden';

  @override
  String get noBridgeDaysFound => 'Keine Brückentage gefunden';

  @override
  String get vacationDays => 'Urlaubstage';

  @override
  String get daysOff => 'Tage frei';

  @override
  String get efficiency => 'Effizienz';

  @override
  String get vacationRecommendation => 'Urlaubsempfehlung';

  @override
  String get vacationDaysNeeded => 'Urlaubstage benötigt';

  @override
  String get totalDaysOff => 'Freie Tage insgesamt';

  @override
  String get relatedHolidays => 'Feiertage';

  @override
  String get veryGood => 'Sehr gut';

  @override
  String get good => 'Gut';

  @override
  String get okay => 'Okay';

  @override
  String get low => 'Niedrig';

  @override
  String get january => 'Januar';

  @override
  String get february => 'Februar';

  @override
  String get march => 'März';

  @override
  String get april => 'April';

  @override
  String get may => 'Mai';

  @override
  String get june => 'Juni';

  @override
  String get july => 'Juli';

  @override
  String get august => 'August';

  @override
  String get september => 'September';

  @override
  String get october => 'Oktober';

  @override
  String get november => 'November';

  @override
  String get december => 'Dezember';

  @override
  String bridgeDayLabel(int days, int total) {
    return '$days Urlaubstage → $total Tage frei';
  }
}
