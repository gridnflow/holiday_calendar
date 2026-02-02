import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/presentation/providers/bridge_day_provider.dart';
import 'package:holiday_calendar/presentation/providers/vacation_provider.dart';

/// Combined widget showing:
/// 1. Urlaubsanspruch (vacation days counter)
/// 2. Efficiency index (1:N ratio for best value vacations)
class VacationEfficiencyWidget extends ConsumerWidget {
  const VacationEfficiencyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vacationAsync = ref.watch(vacationSettingsProvider);
    final recommendations = ref.watch(topBridgeDayRecommendationsProvider);

    return vacationAsync.when(
      data: (vacation) => Card(
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Vacation Counter Section
              _VacationCounterSection(
                vacation: vacation,
                onEdit: () => _showVacationSettingsDialog(context, ref, vacation),
              ),

              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 12),

              // Efficiency Index Section
              _EfficiencyIndexSection(recommendations: recommendations),
            ],
          ),
        ),
      ),
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
    );
  }

  void _showVacationSettingsDialog(
    BuildContext context,
    WidgetRef ref,
    VacationData currentData,
  ) {
    int totalDays = currentData.totalDays;
    int usedDays = currentData.usedDays;
    bool reminder = currentData.resturlaubReminder;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          final theme = Theme.of(context);
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Urlaubseinstellungen',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Total vacation days
                  Text(
                    'Jahresurlaub (Tage)',
                    style: theme.textTheme.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton(
                        onPressed: totalDays > 0
                            ? () => setState(() => totalDays--)
                            : null,
                        icon: const Icon(Icons.remove_circle_outline),
                      ),
                      Expanded(
                        child: Slider(
                          value: totalDays.toDouble(),
                          min: 0,
                          max: 40,
                          divisions: 40,
                          label: '$totalDays',
                          onChanged: (value) {
                            setState(() => totalDays = value.round());
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: totalDays < 40
                            ? () => setState(() => totalDays++)
                            : null,
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                      SizedBox(
                        width: 40,
                        child: Text(
                          '$totalDays',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Used vacation days
                  Text(
                    'Bereits genommen (Tage)',
                    style: theme.textTheme.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton(
                        onPressed: usedDays > 0
                            ? () => setState(() => usedDays--)
                            : null,
                        icon: const Icon(Icons.remove_circle_outline),
                      ),
                      Expanded(
                        child: Slider(
                          value: usedDays.toDouble(),
                          min: 0,
                          max: totalDays.toDouble(),
                          divisions: totalDays > 0 ? totalDays : 1,
                          label: '$usedDays',
                          onChanged: (value) {
                            setState(() => usedDays = value.round());
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: usedDays < totalDays
                            ? () => setState(() => usedDays++)
                            : null,
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                      SizedBox(
                        width: 40,
                        child: Text(
                          '$usedDays',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Resturlaub reminder
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Resturlaub-Erinnerung'),
                    subtitle: const Text('Bis 31. März einlösen'),
                    value: reminder,
                    onChanged: (value) {
                      setState(() => reminder = value);
                    },
                  ),

                  const SizedBox(height: 24),

                  // Save button
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () async {
                        final notifier = ref.read(vacationSettingsProvider.notifier);
                        await notifier.setTotalDays(totalDays);
                        await notifier.setUsedDays(usedDays);
                        await notifier.setResturlaubReminder(reminder);
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Speichern'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Vacation counter section with progress bar
class _VacationCounterSection extends StatelessWidget {
  final VacationData vacation;
  final VoidCallback onEdit;

  const _VacationCounterSection({
    required this.vacation,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final remaining = vacation.remainingDays;
    final total = vacation.totalDays;
    final used = vacation.usedDays;
    final progress = total > 0 ? used / total : 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.beach_access,
                  size: 20,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Urlaubsanspruch',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.edit_outlined, size: 20),
              onPressed: onEdit,
              tooltip: 'Bearbeiten',
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Progress bar
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 12,
            backgroundColor: theme.colorScheme.surfaceContainerHighest,
            valueColor: AlwaysStoppedAnimation<Color>(
              remaining > 5 ? theme.colorScheme.primary : theme.colorScheme.error,
            ),
          ),
        ),
        const SizedBox(height: 8),

        // Stats row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$used von $total Tagen genommen',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: remaining > 5
                    ? theme.colorScheme.primaryContainer
                    : theme.colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '$remaining Tage übrig',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: remaining > 5
                      ? theme.colorScheme.onPrimaryContainer
                      : theme.colorScheme.onErrorContainer,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Efficiency index section showing best 1:N ratios
class _EfficiencyIndexSection extends StatelessWidget {
  final List recommendations;

  const _EfficiencyIndexSection({required this.recommendations});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (recommendations.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.trending_up,
                size: 20,
                color: theme.colorScheme.tertiary,
              ),
              const SizedBox(width: 8),
              Text(
                'Beste Urlaubseffizienz',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Keine Brückentage verfügbar',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.outline,
            ),
          ),
        ],
      );
    }

    // Take top 3 by efficiency
    final top3 = recommendations.take(3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.trending_up,
              size: 20,
              color: theme.colorScheme.tertiary,
            ),
            const SizedBox(width: 8),
            Text(
              'Beste Urlaubseffizienz',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Efficiency items
        ...top3.asMap().entries.map((entry) {
          final index = entry.key;
          final rec = entry.value;
          final isFirst = index == 0;

          return _EfficiencyItem(
            rank: index + 1,
            vacationDays: rec.vacationDaysNeeded,
            totalDaysOff: rec.totalDaysOff,
            efficiency: rec.efficiency,
            holidayName: rec.relatedHolidays.isNotEmpty
                ? rec.relatedHolidays.first.localName
                : '',
            isHighlighted: isFirst,
          );
        }),
      ],
    );
  }
}

/// Single efficiency item row
class _EfficiencyItem extends StatelessWidget {
  final int rank;
  final int vacationDays;
  final int totalDaysOff;
  final double efficiency;
  final String holidayName;
  final bool isHighlighted;

  const _EfficiencyItem({
    required this.rank,
    required this.vacationDays,
    required this.totalDaysOff,
    required this.efficiency,
    required this.holidayName,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: isHighlighted
            ? theme.colorScheme.tertiaryContainer.withValues(alpha: 0.3)
            : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(10),
        border: isHighlighted
            ? Border.all(color: theme.colorScheme.tertiary.withValues(alpha: 0.5))
            : null,
      ),
      child: Row(
        children: [
          // Rank medal
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: _getRankColor(rank),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$rank',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Ratio display
          RichText(
            text: TextSpan(
              style: theme.textTheme.bodyMedium,
              children: [
                TextSpan(
                  text: '1',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
                TextSpan(
                  text: ' Urlaubstag = ',
                  style: TextStyle(color: theme.colorScheme.onSurface),
                ),
                TextSpan(
                  text: '$totalDaysOff',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.tertiary,
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: ' freie Tage',
                  style: TextStyle(color: theme.colorScheme.onSurface),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Holiday name chip
          if (holidayName.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                holidayName.length > 12
                    ? '${holidayName.substring(0, 10)}...'
                    : holidayName,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Color _getRankColor(int rank) {
    switch (rank) {
      case 1:
        return const Color(0xFFFFD700); // Gold
      case 2:
        return const Color(0xFFC0C0C0); // Silver
      case 3:
        return const Color(0xFFCD7F32); // Bronze
      default:
        return Colors.grey;
    }
  }
}
