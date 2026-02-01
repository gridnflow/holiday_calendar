import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/core/theme/app_theme.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';
import 'package:holiday_calendar/presentation/providers/holiday_provider.dart';
import 'package:holiday_calendar/presentation/providers/month_provider.dart';
import 'package:holiday_calendar/presentation/providers/year_provider.dart';
import 'package:table_calendar/table_calendar.dart';

class HolidayCalendar extends ConsumerStatefulWidget {
  const HolidayCalendar({super.key});

  @override
  ConsumerState<HolidayCalendar> createState() => _HolidayCalendarState();
}

class _HolidayCalendarState extends ConsumerState<HolidayCalendar> {
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    final selectedYear = ref.watch(selectedYearProvider);
    final selectedMonth = ref.watch(selectedMonthProvider);
    final holidaysByDate = ref.watch(holidaysByDateProvider);

    final focusedDay = DateTime(selectedYear, selectedMonth, 1);

    return TableCalendar<Holiday>(
      firstDay: DateTime(selectedYear, 1, 1),
      lastDay: DateTime(selectedYear, 12, 31),
      focusedDay: focusedDay,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      eventLoader: (day) {
        final normalizedDay = DateTime(day.year, day.month, day.day);
        return holidaysByDate[normalizedDay] ?? [];
      },
      startingDayOfWeek: StartingDayOfWeek.monday,
      locale: 'de_DE',
      headerVisible: false,
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendTextStyle: const TextStyle(color: Colors.red),
        holidayTextStyle: const TextStyle(color: AppTheme.holidayColor),
        markerDecoration: BoxDecoration(
          color: AppTheme.holidayColor,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: AppTheme.primaryColor.withValues(alpha: 0.5),
          shape: BoxShape.circle,
        ),
        selectedDecoration: const BoxDecoration(
          color: AppTheme.primaryColor,
          shape: BoxShape.circle,
        ),
      ),
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, date, events) {
          if (events.isEmpty) return null;
          return Positioned(
            bottom: 1,
            child: Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: AppTheme.holidayColor,
                shape: BoxShape.circle,
              ),
            ),
          );
        },
      ),
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
        });
        ref.read(selectedMonthProvider.notifier).select(focusedDay.month);
        _showHolidayDetails(context, selectedDay, holidaysByDate);
      },
      onPageChanged: (focusedDay) {
        ref.read(selectedMonthProvider.notifier).select(focusedDay.month);
        ref.read(selectedYearProvider.notifier).select(focusedDay.year);
      },
    );
  }

  void _showHolidayDetails(
    BuildContext context,
    DateTime day,
    Map<DateTime, List<Holiday>> holidaysByDate,
  ) {
    final normalizedDay = DateTime(day.year, day.month, day.day);
    final holidays = holidaysByDate[normalizedDay] ?? [];

    if (holidays.isEmpty) return;

    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${day.day}.${day.month}.${day.year}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            ...holidays.map(
              (holiday) => ListTile(
                leading: const Icon(
                  Icons.celebration,
                  color: AppTheme.holidayColor,
                ),
                title: Text(holiday.localName),
                subtitle: Text(holiday.name),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
