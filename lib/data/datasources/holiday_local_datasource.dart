import 'package:holiday_calendar/core/constants/api_constants.dart';
import 'package:holiday_calendar/core/database/app_database.dart';
import 'package:holiday_calendar/domain/entities/holiday.dart';
import 'package:drift/drift.dart';

abstract class HolidayLocalDataSource {
  Future<List<Holiday>> getHolidays(int year);
  Future<void> cacheHolidays(int year, List<Holiday> holidays);
  Future<bool> isCacheValid(int year);
  Future<void> clearCache();
}

class HolidayLocalDataSourceImpl implements HolidayLocalDataSource {
  final AppDatabase database;

  HolidayLocalDataSourceImpl({required this.database});

  @override
  Future<List<Holiday>> getHolidays(int year) async {
    final rows = await database.getHolidaysByYear(year);
    return rows.map(_mapRowToEntity).toList();
  }

  @override
  Future<void> cacheHolidays(int year, List<Holiday> holidays) async {
    // Delete old cache for this year
    await database.deleteHolidaysByYear(year);

    // Insert new holidays
    final companions = holidays.map((h) => _mapEntityToCompanion(h, year)).toList();
    await database.insertHolidays(companions);
  }

  @override
  Future<bool> isCacheValid(int year) async {
    final result = await (database.select(database.holidayTable)
          ..where((h) => h.year.equals(year))
          ..limit(1))
        .getSingleOrNull();

    if (result == null) return false;

    final cacheAge = DateTime.now().difference(result.cachedAt);
    return cacheAge < ApiConstants.cacheValidDuration;
  }

  @override
  Future<void> clearCache() async {
    await database.clearAllCache();
  }

  Holiday _mapRowToEntity(HolidayTableData row) {
    return Holiday(
      date: row.date,
      localName: row.localName,
      name: row.name,
      countryCode: row.countryCode,
      fixed: row.fixed,
      global: row.global,
      counties: row.counties?.split(','),
      types: row.types?.split(','),
    );
  }

  HolidayTableCompanion _mapEntityToCompanion(Holiday holiday, int year) {
    return HolidayTableCompanion(
      apiId: Value('${holiday.date.toIso8601String()}_${holiday.localName}'),
      date: Value(holiday.date),
      localName: Value(holiday.localName),
      name: Value(holiday.name),
      countryCode: Value(holiday.countryCode),
      fixed: Value(holiday.fixed),
      global: Value(holiday.global),
      counties: Value(holiday.counties?.join(',')),
      types: Value(holiday.types?.join(',')),
      year: Value(year),
      cachedAt: Value(DateTime.now()),
    );
  }
}
