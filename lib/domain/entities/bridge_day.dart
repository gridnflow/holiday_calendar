import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';

part 'bridge_day.freezed.dart';

@freezed
class BridgeDay with _$BridgeDay {
  const factory BridgeDay({
    required DateTime date,
    required int vacationDaysNeeded,
    required int totalDaysOff,
    required double efficiency,
    required Holiday relatedHoliday,
    String? description,
  }) = _BridgeDay;

  const BridgeDay._();

  String get efficiencyLabel {
    if (efficiency >= 4) return 'Sehr gut';
    if (efficiency >= 3) return 'Gut';
    if (efficiency >= 2) return 'Okay';
    return 'Niedrig';
  }
}

@freezed
class BridgeDayRecommendation with _$BridgeDayRecommendation {
  const factory BridgeDayRecommendation({
    required List<DateTime> bridgeDays,
    required int vacationDaysNeeded,
    required int totalDaysOff,
    required double efficiency,
    required DateTime startDate,
    required DateTime endDate,
    required List<Holiday> relatedHolidays,
  }) = _BridgeDayRecommendation;

  const BridgeDayRecommendation._();

  String get label => '$vacationDaysNeeded Urlaubstage → $totalDaysOff Tage frei';
}
