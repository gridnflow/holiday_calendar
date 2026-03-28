import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/core/services/analytics_service.dart';
import 'package:holiday_calendar/core/services/calendar_export_service.dart';
import 'package:holiday_calendar/presentation/providers/bridge_day_provider.dart';
import 'package:holiday_calendar/presentation/providers/year_provider.dart';
import 'package:holiday_calendar/presentation/widgets/bridge_day_card.dart';

class BridgeDayScreen extends ConsumerWidget {
  const BridgeDayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recommendations = ref.watch(bridgeDayRecommendationsProvider);
    final year = ref.watch(selectedYearProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Brückentage $year'),
      ),
      body: recommendations.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.event_busy,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Keine Brückentage gefunden',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: recommendations.length,
              itemBuilder: (context, index) {
                final recommendation = recommendations[index];
                return BridgeDayCard(
                  recommendation: recommendation,
                  onTap: () => _showDetails(context, recommendation),
                );
              },
            ),
    );
  }

  void _showDetails(BuildContext context, dynamic recommendation) {
    AnalyticsService().logBridgeDayViewed(
      vacationDays: recommendation.vacationDaysNeeded,
      totalDaysOff: recommendation.totalDaysOff,
      holidayName: recommendation.relatedHolidays.isNotEmpty
          ? recommendation.relatedHolidays.first.localName
          : '',
    );
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Urlaubsempfehlung',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildInfoRow(
              context,
              Icons.beach_access,
              'Urlaubstage benötigt',
              '${recommendation.vacationDaysNeeded} Tage',
            ),
            _buildInfoRow(
              context,
              Icons.celebration,
              'Freie Tage insgesamt',
              '${recommendation.totalDaysOff} Tage',
            ),
            _buildInfoRow(
              context,
              Icons.trending_up,
              'Effizienz',
              '${recommendation.efficiency.toStringAsFixed(1)}x',
            ),
            const SizedBox(height: 16),
            Text(
              'Feiertage:',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            ...recommendation.relatedHolidays.map<Widget>(
              (h) => Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 4),
                child: Text('• ${h.localName}'),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () async {
                  final ics = CalendarExportService.generateBridgeDayIcs(
                    recommendation,
                  );
                  final success = await CalendarExportService.exportToCalendar(
                    ics,
                    'brueckentage_${recommendation.startDate.toIso8601String().split('T').first}',
                  );
                  if (context.mounted && !success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Kalender-Export konnte nicht geöffnet werden.',
                        ),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.calendar_month),
                label: const Text('Zum Kalender hinzufügen'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(width: 12),
          Expanded(child: Text(label)),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
