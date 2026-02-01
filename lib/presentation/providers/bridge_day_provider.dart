import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/domain/entities/bridge_day.dart';
import 'package:holiday_calendar/domain/usecases/calculate_bridge_days.dart';
import 'package:holiday_calendar/presentation/providers/holiday_provider.dart';
import 'package:holiday_calendar/presentation/providers/year_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bridge_day_provider.g.dart';

@riverpod
CalculateBridgeDays calculateBridgeDays(Ref ref) {
  return CalculateBridgeDays();
}

@riverpod
List<BridgeDayRecommendation> bridgeDayRecommendations(Ref ref) {
  final holidaysAsync = ref.watch(holidayNotifierProvider);
  final year = ref.watch(selectedYearProvider);
  final calculateBridgeDays = ref.watch(calculateBridgeDaysProvider);

  return holidaysAsync.when(
    data: (holidays) => calculateBridgeDays(holidays: holidays, year: year),
    loading: () => [],
    error: (_, _) => [],
  );
}

@riverpod
List<BridgeDayRecommendation> topBridgeDayRecommendations(Ref ref) {
  final recommendations = ref.watch(bridgeDayRecommendationsProvider);
  return recommendations.take(5).toList();
}
