import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('ru'),
    Locale('tr'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In de, this message translates to:
  /// **'Feiertage Deutschland'**
  String get appTitle;

  /// No description provided for @holidays.
  ///
  /// In de, this message translates to:
  /// **'Feiertage'**
  String get holidays;

  /// No description provided for @bridgeDays.
  ///
  /// In de, this message translates to:
  /// **'Brückentage'**
  String get bridgeDays;

  /// No description provided for @allStates.
  ///
  /// In de, this message translates to:
  /// **'Alle Bundesländer'**
  String get allStates;

  /// No description provided for @state.
  ///
  /// In de, this message translates to:
  /// **'Bundesland'**
  String get state;

  /// No description provided for @year.
  ///
  /// In de, this message translates to:
  /// **'Jahr'**
  String get year;

  /// No description provided for @month.
  ///
  /// In de, this message translates to:
  /// **'Monat'**
  String get month;

  /// No description provided for @refresh.
  ///
  /// In de, this message translates to:
  /// **'Aktualisieren'**
  String get refresh;

  /// No description provided for @retry.
  ///
  /// In de, this message translates to:
  /// **'Erneut versuchen'**
  String get retry;

  /// No description provided for @errorOccurred.
  ///
  /// In de, this message translates to:
  /// **'Fehler aufgetreten'**
  String get errorOccurred;

  /// No description provided for @noHolidaysFound.
  ///
  /// In de, this message translates to:
  /// **'Keine Feiertage gefunden'**
  String get noHolidaysFound;

  /// No description provided for @noBridgeDaysFound.
  ///
  /// In de, this message translates to:
  /// **'Keine Brückentage gefunden'**
  String get noBridgeDaysFound;

  /// No description provided for @vacationDays.
  ///
  /// In de, this message translates to:
  /// **'Urlaubstage'**
  String get vacationDays;

  /// No description provided for @daysOff.
  ///
  /// In de, this message translates to:
  /// **'Tage frei'**
  String get daysOff;

  /// No description provided for @efficiency.
  ///
  /// In de, this message translates to:
  /// **'Effizienz'**
  String get efficiency;

  /// No description provided for @vacationRecommendation.
  ///
  /// In de, this message translates to:
  /// **'Urlaubsempfehlung'**
  String get vacationRecommendation;

  /// No description provided for @vacationDaysNeeded.
  ///
  /// In de, this message translates to:
  /// **'Urlaubstage benötigt'**
  String get vacationDaysNeeded;

  /// No description provided for @totalDaysOff.
  ///
  /// In de, this message translates to:
  /// **'Freie Tage insgesamt'**
  String get totalDaysOff;

  /// No description provided for @relatedHolidays.
  ///
  /// In de, this message translates to:
  /// **'Feiertage'**
  String get relatedHolidays;

  /// No description provided for @veryGood.
  ///
  /// In de, this message translates to:
  /// **'Sehr gut'**
  String get veryGood;

  /// No description provided for @good.
  ///
  /// In de, this message translates to:
  /// **'Gut'**
  String get good;

  /// No description provided for @okay.
  ///
  /// In de, this message translates to:
  /// **'Okay'**
  String get okay;

  /// No description provided for @low.
  ///
  /// In de, this message translates to:
  /// **'Niedrig'**
  String get low;

  /// No description provided for @january.
  ///
  /// In de, this message translates to:
  /// **'Januar'**
  String get january;

  /// No description provided for @february.
  ///
  /// In de, this message translates to:
  /// **'Februar'**
  String get february;

  /// No description provided for @march.
  ///
  /// In de, this message translates to:
  /// **'März'**
  String get march;

  /// No description provided for @april.
  ///
  /// In de, this message translates to:
  /// **'April'**
  String get april;

  /// No description provided for @may.
  ///
  /// In de, this message translates to:
  /// **'Mai'**
  String get may;

  /// No description provided for @june.
  ///
  /// In de, this message translates to:
  /// **'Juni'**
  String get june;

  /// No description provided for @july.
  ///
  /// In de, this message translates to:
  /// **'Juli'**
  String get july;

  /// No description provided for @august.
  ///
  /// In de, this message translates to:
  /// **'August'**
  String get august;

  /// No description provided for @september.
  ///
  /// In de, this message translates to:
  /// **'September'**
  String get september;

  /// No description provided for @october.
  ///
  /// In de, this message translates to:
  /// **'Oktober'**
  String get october;

  /// No description provided for @november.
  ///
  /// In de, this message translates to:
  /// **'November'**
  String get november;

  /// No description provided for @december.
  ///
  /// In de, this message translates to:
  /// **'Dezember'**
  String get december;

  /// No description provided for @bridgeDayLabel.
  ///
  /// In de, this message translates to:
  /// **'{days} Urlaubstage → {total} Tage frei'**
  String bridgeDayLabel(int days, int total);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'de', 'en', 'ru', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
