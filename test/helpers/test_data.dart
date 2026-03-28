import 'package:holiday_calendar/domain/entities/holiday.dart';
import 'package:holiday_calendar/domain/entities/federal_state.dart';

/// Shared test data for all test cases
class TestData {
  TestData._();

  static const int testYear = 2026;

  /// Global holidays (apply to all states)
  static final neujahr = Holiday(
    date: DateTime(2026, 1, 1),
    localName: 'Neujahr',
    name: "New Year's Day",
    countryCode: 'DE',
    fixed: true,
    global: true,
  );

  static final tagDerArbeit = Holiday(
    date: DateTime(2026, 5, 1),
    localName: 'Tag der Arbeit',
    name: 'Labour Day',
    countryCode: 'DE',
    fixed: true,
    global: true,
  );

  static final tagDerDeutschenEinheit = Holiday(
    date: DateTime(2026, 10, 3),
    localName: 'Tag der Deutschen Einheit',
    name: 'German Unity Day',
    countryCode: 'DE',
    fixed: true,
    global: true,
  );

  static final weihnachten1 = Holiday(
    date: DateTime(2026, 12, 25),
    localName: '1. Weihnachtstag',
    name: 'Christmas Day',
    countryCode: 'DE',
    fixed: true,
    global: true,
  );

  static final weihnachten2 = Holiday(
    date: DateTime(2026, 12, 26),
    localName: '2. Weihnachtstag',
    name: "St. Stephen's Day",
    countryCode: 'DE',
    fixed: true,
    global: true,
  );

  /// Regional holiday (only in some states)
  static final fronleichnam = Holiday(
    date: DateTime(2026, 6, 4),
    localName: 'Fronleichnam',
    name: 'Corpus Christi',
    countryCode: 'DE',
    fixed: false,
    global: false,
    counties: ['DE-BW', 'DE-BY', 'DE-HE', 'DE-NW', 'DE-RP', 'DE-SL'],
  );

  static final reformationstag = Holiday(
    date: DateTime(2026, 10, 31),
    localName: 'Reformationstag',
    name: 'Reformation Day',
    countryCode: 'DE',
    fixed: true,
    global: false,
    counties: [
      'DE-BB', 'DE-HB', 'DE-HH', 'DE-MV', 'DE-NI',
      'DE-SN', 'DE-ST', 'DE-SH', 'DE-TH',
    ],
  );

  /// All test holidays
  static final allHolidays = [
    neujahr,
    tagDerArbeit,
    fronleichnam,
    tagDerDeutschenEinheit,
    reformationstag,
    weihnachten1,
    weihnachten2,
  ];

  /// Only global holidays
  static final globalHolidays =
      allHolidays.where((h) => h.global).toList();

  /// Federal states for testing
  static const bayern = FederalState(
    code: 'DE-BY',
    nameDE: 'Bayern',
    nameEN: 'Bavaria',
  );

  static const berlin = FederalState(
    code: 'DE-BE',
    nameDE: 'Berlin',
    nameEN: 'Berlin',
  );
}
