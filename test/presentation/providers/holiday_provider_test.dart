import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:holiday_calendar/presentation/providers/holiday_provider.dart';
import 'package:holiday_calendar/presentation/providers/repository_provider.dart';
import 'package:holiday_calendar/presentation/providers/state_provider.dart';
import 'package:holiday_calendar/presentation/providers/year_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/mock_repository.dart';
import '../../helpers/test_data.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('HolidayNotifier Provider', () {
    test('정상 로드 시 공휴일 리스트 반환', () async {
      final mockRepo = MockHolidayRepository(
        result: Right(TestData.allHolidays),
      );

      final container = ProviderContainer(
        overrides: [
          holidayRepositoryProvider.overrideWith((ref) => mockRepo),
        ],
      );
      addTearDown(container.dispose);

      final holidays = await container.read(holidayNotifierProvider.future);
      expect(holidays.length, TestData.allHolidays.length);
    });

    test('네트워크 에러 시 독일어 에러 메시지와 함께 Exception throw', () async {
      final container = ProviderContainer(
        overrides: [
          holidayRepositoryProvider.overrideWith(
            (ref) => NetworkErrorRepository(),
          ),
        ],
      );
      addTearDown(container.dispose);

      try {
        await container.read(holidayNotifierProvider.future);
        fail('Should throw');
      } catch (e) {
        expect(e.toString(), contains('Keine Internetverbindung'));
      }
    });

    test('서버 에러 시 독일어 서버 에러 메시지', () async {
      final container = ProviderContainer(
        overrides: [
          holidayRepositoryProvider.overrideWith(
            (ref) => ServerErrorRepository(),
          ),
        ],
      );
      addTearDown(container.dispose);

      try {
        await container.read(holidayNotifierProvider.future);
        fail('Should throw');
      } catch (e) {
        expect(e.toString(), contains('Serverfehler'));
      }
    });

    test('Berlin 선택 시 Fronleichnam 미포함', () async {
      final mockRepo = MockHolidayRepository(
        result: Right(TestData.allHolidays),
      );

      final container = ProviderContainer(
        overrides: [
          holidayRepositoryProvider.overrideWith((ref) => mockRepo),
        ],
      );
      addTearDown(container.dispose);

      container
          .read(selectedFederalStateProvider.notifier)
          .select(TestData.berlin);

      final holidays = await container.read(holidayNotifierProvider.future);

      expect(holidays.any((h) => h.localName == 'Fronleichnam'), isFalse);
      expect(holidays.any((h) => h.localName == 'Neujahr'), isTrue);
    });

    test('Bayern 선택 시 Fronleichnam 포함', () async {
      final mockRepo = MockHolidayRepository(
        result: Right(TestData.allHolidays),
      );

      final container = ProviderContainer(
        overrides: [
          holidayRepositoryProvider.overrideWith((ref) => mockRepo),
        ],
      );
      addTearDown(container.dispose);

      container
          .read(selectedFederalStateProvider.notifier)
          .select(TestData.bayern);

      final holidays = await container.read(holidayNotifierProvider.future);

      expect(holidays.any((h) => h.localName == 'Fronleichnam'), isTrue);
    });

    test('연도 변경 시 해당 연도로 repository 호출', () async {
      final mockRepo = MockHolidayRepository(
        result: Right(TestData.allHolidays),
      );

      final container = ProviderContainer(
        overrides: [
          holidayRepositoryProvider.overrideWith((ref) => mockRepo),
        ],
      );
      addTearDown(container.dispose);

      await container.read(holidayNotifierProvider.future);
      expect(mockRepo.lastRequestedYear, DateTime.now().year);

      container.read(selectedYearProvider.notifier).select(2027);
      await container.read(holidayNotifierProvider.future);

      expect(mockRepo.lastRequestedYear, 2027);
    });
  });

  group('holidaysByDate Provider', () {
    test('공휴일이 날짜별 Map으로 변환됨', () async {
      final mockRepo = MockHolidayRepository(
        result: Right(TestData.allHolidays),
      );

      final container = ProviderContainer(
        overrides: [
          holidayRepositoryProvider.overrideWith((ref) => mockRepo),
        ],
      );
      addTearDown(container.dispose);

      await container.read(holidayNotifierProvider.future);
      final byDate = container.read(holidaysByDateProvider);

      expect(byDate.isNotEmpty, isTrue);

      final neujahrDate = DateTime(2026, 1, 1);
      expect(byDate.containsKey(neujahrDate), isTrue);
      expect(byDate[neujahrDate]!.any((h) => h.localName == 'Neujahr'), isTrue);
    });

    test('에러 시 빈 Map 반환', () {
      final container = ProviderContainer(
        overrides: [
          holidayRepositoryProvider.overrideWith(
            (ref) => NetworkErrorRepository(),
          ),
        ],
      );
      addTearDown(container.dispose);

      final byDate = container.read(holidaysByDateProvider);
      expect(byDate.isEmpty, isTrue);
    });
  });

  group('SelectedFederalState Provider', () {
    test('초기값은 null', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      expect(container.read(selectedFederalStateProvider), isNull);
    });

    test('select()로 연방주 설정 가능', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container
          .read(selectedFederalStateProvider.notifier)
          .select(TestData.bayern);

      final state = container.read(selectedFederalStateProvider);
      expect(state?.code, 'DE-BY');
      expect(state?.nameDE, 'Bayern');
    });

    test('clear()로 초기화 가능', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container
          .read(selectedFederalStateProvider.notifier)
          .select(TestData.bayern);
      container.read(selectedFederalStateProvider.notifier).clear();

      expect(container.read(selectedFederalStateProvider), isNull);
    });
  });
}
