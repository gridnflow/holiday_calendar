import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale_provider.g.dart';

const String _localeKey = 'app_locale_code';

/// The languages the app ships translations for. Order is the display order
/// in the language picker.
const List<Locale> supportedAppLocales = [
  Locale('de'),
  Locale('en'),
  Locale('tr'),
  Locale('ru'),
  Locale('ar'),
];

/// The user's chosen app locale.
///
/// `null` means "follow the system language" — the default, and what
/// `MaterialApp.locale` should be set to so Flutter resolves against the
/// device locale. A non-null value forces that language regardless of the
/// device setting. Persisted across launches via SharedPreferences.
@riverpod
class AppLocale extends _$AppLocale {
  @override
  Locale? build() {
    _load();
    return null;
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_localeKey);
    if (code != null &&
        supportedAppLocales.any((l) => l.languageCode == code)) {
      state = Locale(code);
    }
  }

  /// Set the app language. Pass `null` to fall back to the system language.
  Future<void> set(Locale? locale) async {
    state = locale;
    final prefs = await SharedPreferences.getInstance();
    if (locale == null) {
      await prefs.remove(_localeKey);
    } else {
      await prefs.setString(_localeKey, locale.languageCode);
    }
  }
}
