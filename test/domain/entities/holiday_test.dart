import 'package:flutter_test/flutter_test.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';

void main() {
  group('Holiday', () {
    test('global 공휴일은 모든 주에 적용', () {
      final holiday = Holiday(
        date: DateTime(2025, 1, 1),
        localName: 'Neujahr',
        name: 'New Year',
        countryCode: 'DE',
        fixed: true,
        global: true,
      );

      expect(holiday.isApplicableTo('DE-BY'), isTrue);
      expect(holiday.isApplicableTo('DE-NW'), isTrue);
      expect(holiday.isApplicableTo(null), isTrue);
    });

    test('지역 공휴일은 해당 주에만 적용', () {
      final holiday = Holiday(
        date: DateTime(2025, 6, 19),
        localName: 'Fronleichnam',
        name: 'Corpus Christi',
        countryCode: 'DE',
        fixed: false,
        global: false,
        counties: ['DE-BW', 'DE-BY', 'DE-HE', 'DE-NW', 'DE-RP', 'DE-SL'],
      );

      expect(holiday.isApplicableTo('DE-BY'), isTrue);
      expect(holiday.isApplicableTo('DE-NW'), isTrue);
      expect(holiday.isApplicableTo('DE-BE'), isFalse); // 베를린은 미적용
      expect(holiday.isApplicableTo('DE-HH'), isFalse); // 함부르크도 미적용
    });

    test('counties가 null이면 모든 주에 적용', () {
      final holiday = Holiday(
        date: DateTime(2025, 12, 25),
        localName: 'Weihnachten',
        name: 'Christmas',
        countryCode: 'DE',
        fixed: true,
        global: false,
        counties: null,
      );

      expect(holiday.isApplicableTo('DE-BY'), isTrue);
      expect(holiday.isApplicableTo('DE-BE'), isTrue);
    });

    test('stateCode가 null이면 true 반환', () {
      final holiday = Holiday(
        date: DateTime(2025, 6, 19),
        localName: 'Fronleichnam',
        name: 'Corpus Christi',
        countryCode: 'DE',
        fixed: false,
        global: false,
        counties: ['DE-BW', 'DE-BY'],
      );

      expect(holiday.isApplicableTo(null), isTrue);
    });
  });
}
