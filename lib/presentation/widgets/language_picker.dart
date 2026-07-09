import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/l10n/app_localizations.dart';
import 'package:holiday_calendar/presentation/providers/locale_provider.dart';

/// Native-name label for each supported language, plus the "system default"
/// option (represented by a null locale).
const Map<String, String> _languageNames = {
  'de': 'Deutsch',
  'en': 'English',
  'tr': 'Türkçe',
  'ru': 'Русский',
  'ar': 'العربية',
};

/// A settings tile that opens a language picker. Shows the currently selected
/// language (or the system-default label) as its subtitle.
class LanguagePickerTile extends ConsumerWidget {
  const LanguagePickerTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = ref.watch(appLocaleProvider);
    final theme = Theme.of(context);

    final subtitle = locale == null
        ? l10n.systemDefault
        : (_languageNames[locale.languageCode] ?? locale.languageCode);

    return ListTile(
      leading: Icon(Icons.language, color: theme.colorScheme.primary),
      title: Text(l10n.language),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => _showLanguageDialog(context, ref),
    );
  }

  Future<void> _showLanguageDialog(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    final current = ref.read(appLocaleProvider);

    await showDialog<void>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(l10n.language),
          children: [
            RadioGroup<String?>(
              groupValue: current?.languageCode,
              onChanged: (value) {
                final locale = value == null ? null : Locale(value);
                ref.read(appLocaleProvider.notifier).set(locale);
                Navigator.pop(context);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // System default (null locale)
                  RadioListTile<String?>(
                    value: null,
                    title: Text(l10n.systemDefault),
                  ),
                  for (final locale in supportedAppLocales)
                    RadioListTile<String?>(
                      value: locale.languageCode,
                      title: Text(_languageNames[locale.languageCode] ??
                          locale.languageCode),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
