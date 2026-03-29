import 'package:flutter/material.dart';
import 'package:holiday_calendar/core/services/calendar_service.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';
import 'package:holiday_calendar/domain/entities/school_holiday.dart';
import 'package:holiday_calendar/domain/entities/vacation.dart';
import 'package:intl/intl.dart';

/// Bottom sheet that shows date details
/// Design requirement: Always show on date tap
class DateDetailSheet extends StatelessWidget {
  final DateTime date;
  final List<Holiday> holidays;
  final String bundesland;
  final SchoolHoliday? schoolHoliday;
  final Vacation? vacation;
  final VoidCallback? onAddVacation;
  final VoidCallback? onDeleteVacation;

  const DateDetailSheet({
    super.key,
    required this.date,
    required this.holidays,
    required this.bundesland,
    this.schoolHoliday,
    this.vacation,
    this.onAddVacation,
    this.onDeleteVacation,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isHoliday = holidays.isNotEmpty;
    final dateFormat = DateFormat('d. MMMM yyyy', 'de_DE');

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),

            // Header with icon and title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isHoliday
                          ? theme.colorScheme.tertiaryContainer
                          : theme.colorScheme.surfaceContainerHighest,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isHoliday ? Icons.celebration : Icons.calendar_today,
                      color: isHoliday
                          ? theme.colorScheme.onTertiaryContainer
                          : theme.colorScheme.onSurfaceVariant,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (isHoliday) ...[
                          Text(
                            holidays.first.localName,
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            dateFormat.format(date),
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ] else ...[
                          Text(
                            dateFormat.format(date),
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _getWeekdayName(date),
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            const Divider(),

            // Bundesland info
            ListTile(
              leading: Icon(
                Icons.location_on_outlined,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              title: const Text('Bundesland'),
              subtitle: Text(bundesland),
            ),

            // Holiday status
            ListTile(
              leading: Icon(
                isHoliday ? Icons.check_circle : Icons.cancel_outlined,
                color: isHoliday
                    ? theme.colorScheme.primary
                    : theme.colorScheme.error,
              ),
              title: Text(
                isHoliday ? 'Gesetzlicher Feiertag' : 'Kein Feiertag',
              ),
              subtitle: isHoliday && holidays.first.global
                  ? const Text('Bundesweit')
                  : isHoliday
                      ? const Text('Regional')
                      : null,
            ),

            // School holiday info
            if (schoolHoliday != null) ...[
              ListTile(
                leading: Icon(
                  Icons.school_outlined,
                  color: theme.colorScheme.secondary,
                ),
                title: Text(schoolHoliday!.localName),
                subtitle: Text(
                  '${DateFormat('d. MMM', 'de_DE').format(schoolHoliday!.startDate)}'
                  ' – ${DateFormat('d. MMM yyyy', 'de_DE').format(schoolHoliday!.endDate)}'
                  ' (${schoolHoliday!.durationDays} Tage)',
                ),
              ),
            ],

            // Vacation info
            if (vacation != null) ...[
              ListTile(
                leading: const Icon(Icons.beach_access, color: Colors.orange),
                title: Text(vacation!.title),
                subtitle: Text(
                  '${DateFormat('d. MMM', 'de_DE').format(vacation!.startDate)}'
                  ' – ${DateFormat('d. MMM yyyy', 'de_DE').format(vacation!.endDate)}'
                  ' (${vacation!.durationDays} Tage)',
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: onDeleteVacation,
                ),
              ),
            ],

            // Add vacation button (only if no vacation on this day)
            if (vacation == null) ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: onAddVacation,
                    icon: const Icon(Icons.add),
                    label: const Text('Urlaub eintragen'),
                  ),
                ),
              ),
            ],

            // Multiple holidays
            if (holidays.length > 1) ...[
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Weitere Feiertage',
                      style: theme.textTheme.titleSmall,
                    ),
                    const SizedBox(height: 8),
                    ...holidays.skip(1).map(
                          (h) => ListTile(
                            dense: true,
                            leading: Icon(
                              Icons.celebration,
                              color: theme.colorScheme.tertiary,
                              size: 20,
                            ),
                            title: Text(h.localName),
                            subtitle: Text(h.name),
                          ),
                        ),
                  ],
                ),
              ),
            ],

            // Add to calendar button
            if (isHoliday) ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () {
                      CalendarService.addHolidayToCalendar(holidays.first);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              '${holidays.first.localName} wird zum Kalender hinzugefügt'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.event_available),
                    label: const Text('Zum Kalender hinzufügen'),
                  ),
                ),
              ),
            ],

            // Brückentag tip (if applicable)
            if (isHoliday) ...[
              _buildBrueckentagTip(context, date, holidays.first),
            ],

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildBrueckentagTip(BuildContext context, DateTime date, Holiday holiday) {
    final theme = Theme.of(context);
    final weekday = date.weekday;

    // Check if Brückentag is possible (Tuesday or Thursday)
    String? tipText;
    String? subtitleText;

    if (weekday == DateTime.tuesday) {
      tipText = 'Montag Urlaub nehmen';
      subtitleText = '→ 4 Tage frei möglich!';
    } else if (weekday == DateTime.thursday) {
      tipText = 'Freitag Urlaub nehmen';
      subtitleText = '→ 4 Tage frei möglich!';
    }

    if (tipText == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Card(
        color: theme.colorScheme.primaryContainer,
        child: ListTile(
          leading: Icon(
            Icons.lightbulb_outline,
            color: theme.colorScheme.onPrimaryContainer,
          ),
          title: Text(
            'Brückentag Tipp',
            style: TextStyle(
              color: theme.colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tipText,
                style: TextStyle(
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
              Text(
                subtitleText!,
                style: TextStyle(
                  color: theme.colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getWeekdayName(DateTime date) {
    final weekdays = [
      'Montag',
      'Dienstag',
      'Mittwoch',
      'Donnerstag',
      'Freitag',
      'Samstag',
      'Sonntag',
    ];
    return weekdays[date.weekday - 1];
  }
}
