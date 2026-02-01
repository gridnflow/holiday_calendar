import 'package:flutter/material.dart';
import 'package:holiday_calendar/core/theme/app_theme.dart';
import 'package:holiday_calendar/domain/entities/bridge_day.dart';
import 'package:intl/intl.dart';

class BridgeDayCard extends StatelessWidget {
  final BridgeDayRecommendation recommendation;
  final VoidCallback? onTap;

  const BridgeDayCard({
    super.key,
    required this.recommendation,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM', 'de_DE');

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: _getEfficiencyColor(recommendation.efficiency),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${recommendation.efficiency.toStringAsFixed(1)}x',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      recommendation.label,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.date_range, size: 18, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(
                    '${dateFormat.format(recommendation.startDate)} - ${dateFormat.format(recommendation.endDate)}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  ...recommendation.relatedHolidays.map(
                    (h) => Chip(
                      label: Text(
                        h.localName,
                        style: const TextStyle(fontSize: 12),
                      ),
                      backgroundColor: AppTheme.holidayColor.withValues(alpha: 0.1),
                      side: BorderSide.none,
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                  ...recommendation.bridgeDays.map(
                    (d) => Chip(
                      label: Text(
                        dateFormat.format(d),
                        style: const TextStyle(fontSize: 12),
                      ),
                      backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.1),
                      side: BorderSide.none,
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                ],
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
