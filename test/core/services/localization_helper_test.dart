import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:holiday_calendar/core/services/localization_helper.dart';
import 'package:holiday_calendar/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Verifies that notification strings resolve to the correct language OUTSIDE
/// a widget tree — the core behavior the notification l10n work relies on.
///
/// We can't observe real notification banners in a headless test, but every
/// user-facing string a notification shows comes from
/// [LocalizationHelper.current], so exercising that end-to-end is the
/// meaningful check: saved language -> right translations, with fallbacks.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const localeKey = 'app_locale_code';

  group('LocalizationHelper.current', () {
    test('returns the saved language for every supported locale', () async {
      // (code, a representative translated string to prove the right bundle).
      const expected = <String, String>{
        'de': 'Brückentage Erinnerungen',
        'en': 'Bridge Day Reminders',
        'tr': 'Köprü günü hatırlatmaları',
      };

      for (final entry in expected.entries) {
        SharedPreferences.setMockInitialValues({localeKey: entry.key});
        final (:l10n, :languageCode) = await LocalizationHelper.current();

        expect(languageCode, entry.key);
        expect(l10n.notifChannelName, entry.value);
      }
    });

    test('every supported locale resolves without throwing', () async {
      for (final locale in AppLocalizations.supportedLocales) {
        SharedPreferences.setMockInitialValues(
            {localeKey: locale.languageCode});
        final (:l10n, :languageCode) = await LocalizationHelper.current();

        expect(languageCode, locale.languageCode);
        // A string that exists in all bundles must be non-empty.
        expect(l10n.notifPlanNowBody, isNotEmpty);
      }
    });

    test('falls back to a supported language when nothing is saved', () async {
      SharedPreferences.setMockInitialValues({});
      final (:l10n, :languageCode) = await LocalizationHelper.current();

      expect(
        AppLocalizations.supportedLocales
            .map((l) => l.languageCode)
            .contains(languageCode),
        isTrue,
        reason: 'device fallback must clamp to a supported locale',
      );
      expect(l10n.notifPlanNowBody, isNotEmpty);
    });

    test('falls back when the saved code is not supported', () async {
      SharedPreferences.setMockInitialValues({localeKey: 'zz'});
      final (l10n: _, :languageCode) = await LocalizationHelper.current();

      expect(languageCode, isNot('zz'));
      expect(
        AppLocalizations.supportedLocales
            .map((l) => l.languageCode)
            .contains(languageCode),
        isTrue,
      );
    });
  });

  group('notification strings are actually localized', () {
    test('no German leaks into the English bundle', () async {
      SharedPreferences.setMockInitialValues({localeKey: 'en'});
      final (:l10n, languageCode: _) = await LocalizationHelper.current();

      expect(l10n.notifEnjoyDayOffBody, 'Enjoy your day off!');
      expect(l10n.notifPlanNowBody, contains('bridge days'));
      // Would be "Brückentage Erinnerungen" if the old hardcoded DE leaked.
      expect(l10n.notifChannelName, isNot(contains('Erinnerungen')));
    });

    test('placeholder + plural strings interpolate per language', () async {
      SharedPreferences.setMockInitialValues({localeKey: 'en'});
      final (:l10n, languageCode: _) = await LocalizationHelper.current();

      expect(l10n.notifHolidayInDaysTitle(5), 'Next holiday in 5 days!');
      expect(l10n.notifHolidayIn7DaysTitle('Easter'), 'In 7 days: Easter');
      // plural: one vs other
      expect(l10n.notifMonthlySummaryTitle('May', 1), 'May: 1 holiday');
      expect(l10n.notifMonthlySummaryTitle('May', 2), 'May: 2 holidays');
    });

    test('the three language bundles differ from each other', () async {
      final channelNames = <String>{};
      for (final code in ['de', 'en', 'tr']) {
        SharedPreferences.setMockInitialValues({localeKey: code});
        final (:l10n, languageCode: _) = await LocalizationHelper.current();
        channelNames.add(l10n.notifChannelName);
      }
      // Three distinct translations => localization is real, not a stub.
      expect(channelNames.length, 3);
    });
  });
}
