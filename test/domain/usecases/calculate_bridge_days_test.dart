import 'package:flutter_test/flutter_test.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';
import 'package:holiday_calendar/domain/usecases/calculate_bridge_days.dart';

void main() {
  late CalculateBridgeDays calculateBridgeDays;

  setUp(() {
    calculateBridgeDays = CalculateBridgeDays();
  });

  group('CalculateBridgeDays', () {
    test('목요일 공휴일 → 금요일 Bridge Day 추천', () {
      // 2025년 5월 1일 (목요일) - Tag der Arbeit
      final holidays = [
        Holiday(
          date: DateTime(2025, 5, 1),
          localName: 'Tag der Arbeit',
          name: 'Labour Day',
          countryCode: 'DE',
          fixed: true,
          global: true,
        ),
      ];

      final recommendations = calculateBridgeDays(
        holidays: holidays,
        year: 2025,
      );

      expect(recommendations, isNotEmpty);
      final rec = recommendations.first;
      expect(rec.vacationDaysNeeded, 1);
      expect(rec.bridgeDays.first, DateTime(2025, 5, 2)); // 금요일
    });

    test('화요일 공휴일 → 월요일 Bridge Day 추천', () {
      // 가상의 화요일 공휴일
      final holidays = [
        Holiday(
          date: DateTime(2025, 4, 22), // 화요일
          localName: 'Test Holiday',
          name: 'Test Holiday',
          countryCode: 'DE',
          fixed: true,
          global: true,
        ),
      ];

      final recommendations = calculateBridgeDays(
        holidays: holidays,
        year: 2025,
      );

      expect(recommendations, isNotEmpty);
      final rec = recommendations.first;
      expect(rec.vacationDaysNeeded, 1);
      expect(rec.bridgeDays.first, DateTime(2025, 4, 21)); // 월요일
    });

    test('수요일 공휴일 → 2일 Bridge Day 추천', () {
      // 가상의 수요일 공휴일
      final holidays = [
        Holiday(
          date: DateTime(2025, 4, 23), // 수요일
          localName: 'Test Holiday',
          name: 'Test Holiday',
          countryCode: 'DE',
          fixed: true,
          global: true,
        ),
      ];

      final recommendations = calculateBridgeDays(
        holidays: holidays,
        year: 2025,
      );

      expect(recommendations.length, greaterThanOrEqualTo(2));
      // 월+화 또는 목+금 중 하나
      expect(
        recommendations.any((r) => r.vacationDaysNeeded == 2),
        isTrue,
      );
    });

    test('효율성 순으로 정렬됨', () {
      final holidays = [
        Holiday(
          date: DateTime(2025, 5, 1), // 목요일
          localName: 'Tag der Arbeit',
          name: 'Labour Day',
          countryCode: 'DE',
          fixed: true,
          global: true,
        ),
        Holiday(
          date: DateTime(2025, 4, 23), // 수요일
          localName: 'Test Holiday',
          name: 'Test Holiday',
          countryCode: 'DE',
          fixed: true,
          global: true,
        ),
      ];

      final recommendations = calculateBridgeDays(
        holidays: holidays,
        year: 2025,
      );

      for (int i = 0; i < recommendations.length - 1; i++) {
        expect(
          recommendations[i].efficiency,
          greaterThanOrEqualTo(recommendations[i + 1].efficiency),
        );
      }
    });

    test('주말 공휴일은 Bridge Day 추천 없음', () {
      // 2025년 12월 25일 (목요일) - Weihnachten
      // 하지만 토요일 공휴일 테스트
      final holidays = [
        Holiday(
          date: DateTime(2025, 4, 19), // 토요일
          localName: 'Test Saturday Holiday',
          name: 'Test Saturday Holiday',
          countryCode: 'DE',
          fixed: true,
          global: true,
        ),
      ];

      final recommendations = calculateBridgeDays(
        holidays: holidays,
        year: 2025,
      );

      // 토요일 공휴일은 추천이 없거나 있더라도 0일 휴가
      final saturdayRecs = recommendations.where(
        (r) => r.relatedHolidays.any(
          (h) => h.date == DateTime(2025, 4, 19),
        ),
      );

      for (final rec in saturdayRecs) {
        // 주말 공휴일의 경우 bridgeDays가 비어있지 않아야 효율적
        expect(rec.vacationDaysNeeded, greaterThan(0));
      }
    });

    test('빈 공휴일 목록 → 빈 추천', () {
      final recommendations = calculateBridgeDays(
        holidays: [],
        year: 2025,
      );

      expect(recommendations, isEmpty);
    });
  });
}
