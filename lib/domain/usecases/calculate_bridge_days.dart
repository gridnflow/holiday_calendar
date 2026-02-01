import 'package:holiday_calendar/domain/entities/bridge_day.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';

class CalculateBridgeDays {
  List<BridgeDayRecommendation> call({
    required List<Holiday> holidays,
    required int year,
  }) {
    final recommendations = <BridgeDayRecommendation>[];
    final holidayDates = holidays.map((h) => _normalizeDate(h.date)).toSet();

    for (final holiday in holidays) {
      final holidayDate = _normalizeDate(holiday.date);
      final weekday = holidayDate.weekday;

      // 목요일 공휴일 → 금요일 Bridge Day (1일 휴가 → 4일 연휴)
      if (weekday == DateTime.thursday) {
        final friday = holidayDate.add(const Duration(days: 1));
        if (!_isWeekend(friday) && !holidayDates.contains(friday)) {
          recommendations.add(_createRecommendation(
            bridgeDays: [friday],
            holidays: [holiday],
            year: year,
          ));
        }
      }

      // 화요일 공휴일 → 월요일 Bridge Day (1일 휴가 → 4일 연휴)
      if (weekday == DateTime.tuesday) {
        final monday = holidayDate.subtract(const Duration(days: 1));
        if (!_isWeekend(monday) && !holidayDates.contains(monday)) {
          recommendations.add(_createRecommendation(
            bridgeDays: [monday],
            holidays: [holiday],
            year: year,
          ));
        }
      }

      // 수요일 공휴일 → 월+화 또는 목+금 Bridge Day (2일 휴가 → 5일 연휴)
      if (weekday == DateTime.wednesday) {
        final monday = holidayDate.subtract(const Duration(days: 2));
        final tuesday = holidayDate.subtract(const Duration(days: 1));

        if (!holidayDates.contains(monday) && !holidayDates.contains(tuesday)) {
          recommendations.add(_createRecommendation(
            bridgeDays: [monday, tuesday],
            holidays: [holiday],
            year: year,
          ));
        }

        final thursday = holidayDate.add(const Duration(days: 1));
        final friday = holidayDate.add(const Duration(days: 2));

        if (!holidayDates.contains(thursday) && !holidayDates.contains(friday)) {
          recommendations.add(_createRecommendation(
            bridgeDays: [thursday, friday],
            holidays: [holiday],
            year: year,
          ));
        }
      }
    }

    // 연속된 공휴일 사이의 Bridge Day 찾기
    final sortedHolidays = holidays.toList()
      ..sort((a, b) => a.date.compareTo(b.date));

    for (int i = 0; i < sortedHolidays.length - 1; i++) {
      final current = sortedHolidays[i];
      final next = sortedHolidays[i + 1];

      final daysBetween = next.date.difference(current.date).inDays;

      if (daysBetween >= 2 && daysBetween <= 4) {
        final bridgeDays = <DateTime>[];
        var checkDate = _normalizeDate(current.date).add(const Duration(days: 1));

        while (checkDate.isBefore(_normalizeDate(next.date))) {
          if (!_isWeekend(checkDate) && !holidayDates.contains(checkDate)) {
            bridgeDays.add(checkDate);
          }
          checkDate = checkDate.add(const Duration(days: 1));
        }

        if (bridgeDays.isNotEmpty && bridgeDays.length <= 3) {
          recommendations.add(_createRecommendation(
            bridgeDays: bridgeDays,
            holidays: [current, next],
            year: year,
          ));
        }
      }
    }

    // 효율성 순으로 정렬
    recommendations.sort((a, b) => b.efficiency.compareTo(a.efficiency));

    return recommendations;
  }

  BridgeDayRecommendation _createRecommendation({
    required List<DateTime> bridgeDays,
    required List<Holiday> holidays,
    required int year,
  }) {
    final allDates = <DateTime>[
      ...bridgeDays,
      ...holidays.map((h) => _normalizeDate(h.date)),
    ];

    // 주말 포함하여 연속 기간 계산
    allDates.sort();
    var startDate = allDates.first;
    var endDate = allDates.last;

    // 앞쪽 주말 포함
    while (startDate.weekday == DateTime.saturday ||
        startDate.weekday == DateTime.sunday ||
        startDate.subtract(const Duration(days: 1)).weekday == DateTime.saturday ||
        startDate.subtract(const Duration(days: 1)).weekday == DateTime.sunday) {
      final prev = startDate.subtract(const Duration(days: 1));
      if (_isWeekend(prev)) {
        startDate = prev;
      } else {
        break;
      }
    }

    // 뒤쪽 주말 포함
    while (endDate.weekday == DateTime.saturday ||
        endDate.weekday == DateTime.sunday ||
        endDate.add(const Duration(days: 1)).weekday == DateTime.saturday ||
        endDate.add(const Duration(days: 1)).weekday == DateTime.sunday) {
      final next = endDate.add(const Duration(days: 1));
      if (_isWeekend(next)) {
        endDate = next;
      } else {
        break;
      }
    }

    final totalDaysOff = endDate.difference(startDate).inDays + 1;
    final vacationDaysNeeded = bridgeDays.length;
    final efficiency = vacationDaysNeeded > 0
        ? totalDaysOff / vacationDaysNeeded
        : 0.0;

    return BridgeDayRecommendation(
      bridgeDays: bridgeDays,
      vacationDaysNeeded: vacationDaysNeeded,
      totalDaysOff: totalDaysOff,
      efficiency: efficiency,
      startDate: startDate,
      endDate: endDate,
      relatedHolidays: holidays,
    );
  }

  DateTime _normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  bool _isWeekend(DateTime date) {
    return date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
  }
}
