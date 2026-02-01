import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

class HolidayTable extends Table {
  TextColumn get apiId => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get localName => text()();
  TextColumn get name => text()();
  TextColumn get countryCode => text()();
  BoolColumn get fixed => boolean().withDefault(const Constant(false))();
  BoolColumn get global => boolean().withDefault(const Constant(true))();
  TextColumn get counties => text().nullable()();
  TextColumn get types => text().nullable()();
  IntColumn get year => integer()();
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {apiId, year};
}

@DriftDatabase(tables: [HolidayTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // 특정 연도의 공휴일 조회
  Future<List<HolidayTableData>> getHolidaysByYear(int year) {
    return (select(holidayTable)..where((h) => h.year.equals(year))).get();
  }

  // 특정 연도의 공휴일 삭제
  Future<int> deleteHolidaysByYear(int year) {
    return (delete(holidayTable)..where((h) => h.year.equals(year))).go();
  }

  // 공휴일 일괄 저장
  Future<void> insertHolidays(List<HolidayTableCompanion> holidays) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(holidayTable, holidays);
    });
  }

  // 캐시 유효성 확인 (24시간)
  Future<bool> isCacheValid(int year) async {
    final result = await (select(holidayTable)
          ..where((h) => h.year.equals(year))
          ..limit(1))
        .getSingleOrNull();

    if (result == null) return false;

    final cacheAge = DateTime.now().difference(result.cachedAt);
    return cacheAge.inHours < 24;
  }

  // 전체 캐시 삭제
  Future<int> clearAllCache() {
    return delete(holidayTable).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'holiday_calendar.db'));
    return NativeDatabase.createInBackground(file);
  });
}
