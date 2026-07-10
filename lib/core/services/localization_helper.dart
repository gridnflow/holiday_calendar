import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:holiday_calendar/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Resolves an [AppLocalizations] instance OUTSIDE a widget tree.
///
/// Services like notifications, calendar export, and the home-screen widget
/// build user-facing strings without a `BuildContext`, so they cannot use
/// `AppLocalizations.of(context)`. This helper picks the user's saved app
/// language (or the device language when they follow the system default),
/// clamps it to a supported locale, and returns the matching translations.
class LocalizationHelper {
  LocalizationHelper._();

  // Kept in sync with AppLocale's SharedPreferences key.
  static const String _localeKey = 'app_locale_code';

  /// The best [AppLocalizations] for the current app-language setting,
  /// together with its resolved language code (useful for
  /// `Holiday.displayName`).
  static Future<({AppLocalizations l10n, String languageCode})>
      current() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_localeKey);

    final code = (saved != null && _isSupported(saved))
        ? saved
        : _deviceLanguageCode();

    return (l10n: lookupAppLocalizations(Locale(code)), languageCode: code);
  }

  static String _deviceLanguageCode() {
    final code = ui.PlatformDispatcher.instance.locale.languageCode;
    return _isSupported(code) ? code : 'de';
  }

  static bool _isSupported(String code) =>
      AppLocalizations.supportedLocales.any((l) => l.languageCode == code);
}
