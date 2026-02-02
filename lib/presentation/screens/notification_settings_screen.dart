import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/presentation/providers/notification_provider.dart';

/// Screen for configuring Brückentage notification settings
class NotificationSettingsScreen extends ConsumerWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final settingsAsync = ref.watch(notificationSettingsProvider);
    final notificationsSupported = ref.watch(notificationsSupportedProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Benachrichtigungen'),
        centerTitle: true,
      ),
      body: settingsAsync.when(
        data: (settings) => ListView(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
              child: Row(
                children: [
                  Icon(
                    Icons.notifications_active,
                    size: 48,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Brückentage Erinnerungen',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Werde rechtzeitig an optimale Urlaubstage erinnert',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            if (!notificationsSupported) ...[
              const SizedBox(height: 16),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                color: theme.colorScheme.errorContainer,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.warning_amber,
                        color: theme.colorScheme.onErrorContainer,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Benachrichtigungen werden auf dieser Plattform nicht unterstützt.',
                          style: TextStyle(
                            color: theme.colorScheme.onErrorContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],

            const SizedBox(height: 16),

            // Enable notifications toggle
            SwitchListTile(
              title: const Text('Brückentage Benachrichtigungen'),
              subtitle: const Text('Erhalte Erinnerungen vor optimalen Urlaubstagen'),
              value: settings.brueckentagEnabled,
              onChanged: notificationsSupported
                  ? (value) {
                      ref
                          .read(notificationSettingsProvider.notifier)
                          .setBrueckentagEnabled(value);
                    }
                  : null,
              secondary: Icon(
                settings.brueckentagEnabled
                    ? Icons.notifications_active
                    : Icons.notifications_off_outlined,
                color: settings.brueckentagEnabled
                    ? theme.colorScheme.primary
                    : theme.colorScheme.outline,
              ),
            ),

            const Divider(),

            // Reminder days selector
            ListTile(
              enabled: settings.brueckentagEnabled,
              leading: Icon(
                Icons.schedule,
                color: settings.brueckentagEnabled
                    ? theme.colorScheme.primary
                    : theme.colorScheme.outline,
              ),
              title: const Text('Erinnerung vor'),
              subtitle: Text(
                '${settings.reminderDaysBefore} Tage vorher',
                style: TextStyle(
                  color: settings.brueckentagEnabled
                      ? theme.colorScheme.primary
                      : theme.colorScheme.outline,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: settings.brueckentagEnabled
                  ? const Icon(Icons.chevron_right)
                  : null,
              onTap: settings.brueckentagEnabled
                  ? () => _showReminderDaysDialog(context, ref, settings)
                  : null,
            ),

            const Divider(),

            // Info section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'So funktioniert es',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildInfoItem(
                    context,
                    Icons.auto_awesome,
                    'Automatische Erkennung',
                    'Die App findet die besten Brückentage basierend auf deinem Bundesland.',
                  ),
                  const SizedBox(height: 8),
                  _buildInfoItem(
                    context,
                    Icons.notification_add,
                    'Rechtzeitige Erinnerung',
                    'Du wirst X Tage vor dem optimalen Zeitraum benachrichtigt.',
                  ),
                  const SizedBox(height: 8),
                  _buildInfoItem(
                    context,
                    Icons.beach_access,
                    'Mehr Urlaub',
                    'Nutze wenige Urlaubstage für maximale freie Zeit!',
                  ),
                ],
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 48,
                color: theme.colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                'Fehler beim Laden der Einstellungen',
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => ref.invalidate(notificationSettingsProvider),
                child: const Text('Erneut versuchen'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(
    BuildContext context,
    IconData icon,
    String title,
    String description,
  ) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: theme.colorScheme.primary,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                description,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showReminderDaysDialog(
    BuildContext context,
    WidgetRef ref,
    NotificationSettingsData settings,
  ) {
    final options = [3, 5, 7, 14, 21, 30];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Erinnerung vor'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: options.map((days) {
            final isSelected = settings.reminderDaysBefore == days;
            return ListTile(
              leading: Icon(
                isSelected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.outline,
              ),
              title: Text('$days Tage'),
              onTap: () {
                ref
                    .read(notificationSettingsProvider.notifier)
                    .setReminderDaysBefore(days);
                Navigator.pop(context);
              },
            );
          }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Abbrechen'),
          ),
        ],
      ),
    );
  }
}
