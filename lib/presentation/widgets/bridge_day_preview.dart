import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/presentation/providers/bridge_day_provider.dart';
import 'package:holiday_calendar/presentation/screens/bridge_day_screen.dart';
import 'package:intl/intl.dart';

/// Compact preview of top Brückentage recommendations
/// Shown below the calendar on the home screen
class BridgeDayPreview extends ConsumerWidget {
  const BridgeDayPreview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recommendations = ref.watch(topBridgeDayRecommendationsProvider);
    final theme = Theme.of(context);

    if (recommendations.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.lightbulb_outline,
                    size: 20,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Brückentage Tipps',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const BridgeDayScreen()),
                  );
                },
                child: const Text('Alle anzeigen'),
              ),
            ],
          ),
        ),
        // Horizontal scrolling cards
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: recommendations.length,
            itemBuilder: (context, index) {
              final recommendation = recommendations[index];
              final isPast = recommendation.endDate.isBefore(DateTime.now());
              return _BridgeDayPreviewCard(
                vacationDays: recommendation.vacationDaysNeeded,
                totalDaysOff: recommendation.totalDaysOff,
                efficiency: recommendation.efficiency,
                holidayName: recommendation.relatedHolidays.isNotEmpty
                    ? recommendation.relatedHolidays.first.localName
                    : '',
                dateRange:
                    '${DateFormat('dd.MM', 'de_DE').format(recommendation.startDate)} - ${DateFormat('dd.MM', 'de_DE').format(recommendation.endDate)}',
                isPast: isPast,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const BridgeDayScreen()),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _BridgeDayPreviewCard extends StatelessWidget {
  final int vacationDays;
  final int totalDaysOff;
  final double efficiency;
  final String holidayName;
  final String dateRange;
  final bool isPast;
  final VoidCallback? onTap;

  const _BridgeDayPreviewCard({
    required this.vacationDays,
    required this.totalDaysOff,
    required this.efficiency,
    required this.holidayName,
    required this.dateRange,
    this.isPast = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final disabledColor = theme.colorScheme.onSurface.withValues(alpha: 0.38);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      color: isPast ? theme.colorScheme.surfaceContainerHighest : null,
      child: InkWell(
        onTap: isPast ? null : onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 160,
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Efficiency badge
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: isPast
                          ? theme.colorScheme.surfaceContainerHighest
                          : _getEfficiencyColor(efficiency),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${efficiency.toStringAsFixed(1)}x',
                      style: TextStyle(
                        color: isPast ? disabledColor : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: disabledColor,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Main info
              Text(
                '$vacationDays → $totalDaysOff Tage',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isPast ? disabledColor : null,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                holidayName,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: isPast ? disabledColor : theme.colorScheme.tertiary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                dateRange,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: disabledColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getEfficiencyColor(double efficiency) {
    if (efficiency >= 4) return Colors.green;
    if (efficiency >= 3) return Colors.teal;
    if (efficiency >= 2) return Colors.orange;
    return Colors.grey;
  }
}
