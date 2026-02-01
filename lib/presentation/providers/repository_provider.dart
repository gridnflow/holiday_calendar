import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/core/database/app_database.dart';
import 'package:holiday_calendar/data/datasources/holiday_local_datasource.dart';
import 'package:holiday_calendar/data/datasources/holiday_remote_datasource.dart';
import 'package:holiday_calendar/data/repositories/holiday_repository_impl.dart';
import 'package:holiday_calendar/domain/repositories/holiday_repository.dart';
import 'package:holiday_calendar/presentation/providers/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

/// Database provider - singleton instance
@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final database = AppDatabase();
  ref.onDispose(() => database.close());
  return database;
}

/// Remote data source provider
@riverpod
HolidayRemoteDataSource holidayRemoteDataSource(Ref ref) {
  return HolidayRemoteDataSourceImpl(dio: ref.watch(dioProvider));
}

/// Local data source provider (Drift)
@riverpod
HolidayLocalDataSource holidayLocalDataSource(Ref ref) {
  return HolidayLocalDataSourceImpl(database: ref.watch(appDatabaseProvider));
}

/// Repository provider with offline-first strategy
@riverpod
HolidayRepository holidayRepository(Ref ref) {
  return HolidayRepositoryImpl(
    remoteDataSource: ref.watch(holidayRemoteDataSourceProvider),
    localDataSource: ref.watch(holidayLocalDataSourceProvider),
  );
}
