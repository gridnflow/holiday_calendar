import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';
import 'package:holiday_calendar/presentation/providers/holiday_provider.dart';
import 'package:holiday_calendar/presentation/providers/month_provider.dart';
import 'package:holiday_calendar/presentation/providers/year_provider.dart';
import 'package:intl/intl.dart';

/// Year overview screen showing all 12 months in a grid
class YearOverviewScreen extends ConsumerWidget {
  const YearOverviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final year = ref.watch(selectedYearProvider);
    final holidaysByDate = ref.watch(holidaysByDateProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('$year'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            tooltip: 'Vorheriges Jahr',
            onPressed: () {
              ref.read(selectedYearProvider.notifier).select(year - 1);
            },
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            tooltip: 'Nächstes Jahr',
            onPressed: () {
              ref.read(selectedYearProvider.notifier).select(year + 1);
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.85,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          final month = index + 1;
          return _MiniMonthCard(
            year: year,
            month: month,
            holidaysByDate: holidaysByDate,
            onTap: () {
              // Navigate back to home with selected month
              ref.read(selectedMonthProvider.notifier).select(month);
              Navigator.pop(context);
            },
          );
        },
      ),
      // Year summary at bottom
      bottomNavigationBar: _YearSummaryBar(
        year: year,
        holidaysByDate: holidaysByDate,
      ),
    );
  }
}

/// Mini month card showing a compact calendar
class _MiniMonthCard extends StatelessWidget {
  final int year;
  final int month;
  final Map<DateTime, List<Holiday>> holidaysByDate;
  final VoidCallback onTap;

  const _MiniMonthCard({
    required this.year,
    required this.month,
    required this.holidaysByDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final monthName = DateFormat('MMMM', 'de_DE').format(DateTime(year, month));
    final isCurrentMonth = DateTime.now().year == year && DateTime.now().month == month;

    return Card(
      elevation: isCurrentMonth ? 4 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isCurrentMonth
            ? BorderSide(color: theme.colorScheme.primary, width: 2)
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Month name
              Text(
                monthName,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isCurrentMonth
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              // Day headers
              _buildDayHeaders(context),
              const SizedBox(height: 2),
              // Calendar grid
              Expanded(
                child: _buildCalendarGrid(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDayHeaders(BuildContext context) {
    final theme = Theme.of(context);
    const days = ['M', 'D', 'M', 'D', 'F', 'S', 'S'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days.asMap().entries.map((entry) {
        final isWeekend = entry.key >= 5;
        return SizedBox(
          width: 14,
          child: Text(
            entry.value,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w600,
              color: isWeekend
                  ? theme.colorScheme.error.withValues(alpha: 0.7)
                  : theme.colorScheme.outline,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCalendarGrid(BuildContext context) {
    final theme = Theme.of(context);
    final firstDay = DateTime(year, month, 1);
    final lastDay = DateTime(year, month + 1, 0);
    final startWeekday = firstDay.weekday; // 1 = Monday
    final daysInMonth = lastDay.day;

    final today = DateTime.now();

    bool isToday(DateTime day) {
      return day.year == today.year &&
          day.month == today.month &&
          day.day == today.day;
    }

    // Build 6 weeks x 7 days grid
    List<Widget> rows = [];
    int dayCounter = 1 - (startWeekday - 1);

    for (int week = 0; week < 6; week++) {
      List<Widget> weekDays = [];
      for (int weekday = 0; weekday < 7; weekday++) {
        if (dayCounter < 1 || dayCounter > daysInMonth) {
          weekDays.add(const SizedBox(width: 14, height: 14));
        } else {
          final day = DateTime(year, month, dayCounter);
          final normalizedDay = DateTime(day.year, day.month, day.day);
          final holidays = holidaysByDate[normalizedDay] ?? [];
          final isHoliday = holidays.isNotEmpty;
          // Check if any holiday is nationwide (global)
          final isNationalHoliday = holidays.any((h) => h.global);
          final isWeekend = weekday >= 5;
          final isTodayDate = isToday(day);

          Color textColor;
          Color? bgColor;

          if (isTodayDate) {
            textColor = theme.colorScheme.onPrimary;
            bgColor = theme.colorScheme.primary;
          } else if (isNationalHoliday) {
            // Nationwide holiday - strong tertiary color
            textColor = theme.colorScheme.tertiary;
            bgColor = theme.colorScheme.tertiaryContainer.withValues(alpha: 0.5);
          } else if (isHoliday) {
            // Regional holiday - lighter/outline style
            textColor = theme.colorScheme.outline;
            bgColor = theme.colorScheme.surfaceContainerHighest;
          } else if (isWeekend) {
            textColor = theme.colorScheme.error.withValues(alpha: 0.7);
          } else {
            textColor = theme.colorScheme.onSurface;
          }

          weekDays.add(
            Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: bgColor,
              ),
              child: Center(
                child: Text(
                  '$dayCounter',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: isHoliday || isTodayDate
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: textColor,
                  ),
                ),
              ),
            ),
          );
        }
        dayCounter++;
      }
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: weekDays,
        ),
      );
      // Stop if we've gone past the last day
      if (dayCounter > daysInMonth && week >= 3) break;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: rows,
    );
  }
}

/// Bottom bar showing year summary
class _YearSummaryBar extends StatelessWidget {
  final int year;
  final Map<DateTime, List<Holiday>> holidaysByDate;

  const _YearSummaryBar({
    required this.year,
    required this.holidaysByDate,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Count holidays in this year - distinguish national vs regional
    int nationalHolidayCount = 0;
    int regionalHolidayCount = 0;
    int weekendNationalCount = 0;

    holidaysByDate.forEach((date, holidays) {
      if (date.year == year && holidays.isNotEmpty) {
        final hasNational = holidays.any((h) => h.global);
        final isWeekend = date.weekday == DateTime.saturday ||
            date.weekday == DateTime.sunday;

        if (hasNational) {
          nationalHolidayCount++;
          if (isWeekend) weekendNationalCount++;
        } else {
          regionalHolidayCount++;
        }
      }
    });

    final effectiveNational = nationalHolidayCount - weekendNationalCount;

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          border: Border(
            top: BorderSide(color: theme.colorScheme.outlineVariant),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _SummaryItem(
              icon: Icons.public,
              label: 'Bundesweit',
              value: '$nationalHolidayCount',
              color: theme.colorScheme.tertiary,
            ),
            _SummaryItem(
              icon: Icons.location_on,
              label: 'Regional',
              value: '$regionalHolidayCount',
              color: theme.colorScheme.outline,
            ),
            _SummaryItem(
              icon: Icons.event_available,
              label: 'Zusätzlich frei',
              value: '$effectiveNational',
              color: theme.colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _SummaryItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(width: 4),
            Text(
              value,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.outline,
          ),
        ),
      ],
    );
  }
}
