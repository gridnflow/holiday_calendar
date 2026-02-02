import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';
import 'package:holiday_calendar/presentation/providers/holiday_provider.dart';
import 'package:holiday_calendar/presentation/providers/month_provider.dart';
import 'package:holiday_calendar/presentation/providers/state_provider.dart';
import 'package:holiday_calendar/presentation/providers/year_provider.dart';
import 'package:holiday_calendar/presentation/widgets/calendar/date_detail_sheet.dart';
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
    final selectedState = ref.watch(selectedFederalStateProvider);
    final theme = Theme.of(context);

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
      daysOfWeekHeight: 40,
      rowHeight: 52,
      weekNumbersVisible: true,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: theme.textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onSurface,
        ),
        weekendStyle: theme.textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.error,
        ),
      ),
      calendarBuilders: CalendarBuilders(
        // Week number builder (KW)
        weekNumberBuilder: (context, weekNumber) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(right: 4),
            child: Text(
              'KW$weekNumber',
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.outline,
                fontSize: 10,
              ),
            ),
          );
        },
        // Default day builder
        defaultBuilder: (context, day, focusedDay) {
          return _buildDateCell(
            context,
            day,
            holidaysByDate,
            isToday: false,
            isSelected: false,
            isOutside: false,
          );
        },
        // Today builder - circle border
        todayBuilder: (context, day, focusedDay) {
          return _buildDateCell(
            context,
            day,
            holidaysByDate,
            isToday: true,
            isSelected: false,
            isOutside: false,
          );
        },
        // Selected day builder - filled circle
        selectedBuilder: (context, day, focusedDay) {
          return _buildDateCell(
            context,
            day,
            holidaysByDate,
            isToday: isSameDay(day, DateTime.now()),
            isSelected: true,
            isOutside: false,
          );
        },
        // Outside days (other months)
        outsideBuilder: (context, day, focusedDay) {
          return _buildDateCell(
            context,
            day,
            holidaysByDate,
            isToday: false,
            isSelected: false,
            isOutside: true,
          );
        },
        // Holiday marker (dot)
        markerBuilder: (context, date, events) {
          if (events.isEmpty) return null;
          return Positioned(
            bottom: 6,
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: theme.colorScheme.tertiary,
                shape: BoxShape.circle,
              ),
            ),
          );
        },
      ),
      // Always show bottom sheet on day tap
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
        });
        ref.read(selectedMonthProvider.notifier).select(focusedDay.month);

        // Always show bottom sheet (design requirement)
        _showDateDetailSheet(
          context,
          selectedDay,
          holidaysByDate,
          selectedState?.nameDE ?? 'Alle Bundesländer',
        );
      },
      onPageChanged: (focusedDay) {
        ref.read(selectedMonthProvider.notifier).select(focusedDay.month);
        ref.read(selectedYearProvider.notifier).select(focusedDay.year);
      },
    );
  }

  Widget _buildDateCell(
    BuildContext context,
    DateTime day,
    Map<DateTime, List<Holiday>> holidaysByDate, {
    required bool isToday,
    required bool isSelected,
    required bool isOutside,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final normalizedDay = DateTime(day.year, day.month, day.day);
    final holidays = holidaysByDate[normalizedDay] ?? [];
    final isHoliday = holidays.isNotEmpty;
    final isWeekend = day.weekday == DateTime.saturday || day.weekday == DateTime.sunday;

    // Background color
    Color? backgroundColor;
    if (isSelected) {
      backgroundColor = colorScheme.primary;
    }

    // Border (only for today, not selected)
    BoxBorder? border;
    if (isToday && !isSelected) {
      border = Border.all(
        color: colorScheme.primary,
        width: 2,
      );
    }

    // Text color based on state priority
    Color textColor;
    if (isOutside) {
      textColor = colorScheme.outline;
    } else if (isSelected) {
      textColor = colorScheme.onPrimary;
    } else if (isHoliday) {
      textColor = colorScheme.tertiary;
    } else if (isWeekend) {
      textColor = colorScheme.error;
    } else if (isToday) {
      textColor = colorScheme.primary;
    } else {
      textColor = colorScheme.onSurface;
    }

    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: border,
      ),
      child: Center(
        child: Text(
          '${day.day}',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: textColor,
            fontWeight: isToday || isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  void _showDateDetailSheet(
    BuildContext context,
    DateTime day,
    Map<DateTime, List<Holiday>> holidaysByDate,
    String bundesland,
  ) {
    final normalizedDay = DateTime(day.year, day.month, day.day);
    final holidays = holidaysByDate[normalizedDay] ?? [];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DateDetailSheet(
        date: day,
        holidays: holidays,
        bundesland: bundesland,
      ),
    );
  }
}
