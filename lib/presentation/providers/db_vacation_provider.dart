import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/core/database/app_database.dart';
import 'package:holiday_calendar/domain/entities/vacation.dart';
import 'package:holiday_calendar/presentation/providers/repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'db_vacation_provider.g.dart';

@riverpod
Stream<List<Vacation>> dbVacations(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.watchAllVacations().map((rows) => rows
      .map((r) => Vacation(
            id: r.id,
            title: r.title,
            startDate: r.startDate,
            endDate: r.endDate,
          ))
      .toList());
}

@riverpod
class VacationNotifier extends _$VacationNotifier {
  @override
  Future<void> build() async {}

  Future<void> addVacation({
    required String title,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final db = ref.read(appDatabaseProvider);
    await db.insertVacation(VacationTableCompanion.insert(
      title: title,
      startDate: startDate,
      endDate: endDate,
    ));
  }

  Future<void> deleteVacation(int id) async {
    final db = ref.read(appDatabaseProvider);
    await db.deleteVacation(id);
  }
}

/// Map of date → vacation for quick lookup (all dates in range)
@riverpod
Map<DateTime, Vacation> dbVacationsByDate(Ref ref) {
  final vacations = ref.watch(dbVacationsProvider).valueOrNull ?? [];
  final map = <DateTime, Vacation>{};
  for (final vacation in vacations) {
    var current = DateTime(
      vacation.startDate.year,
      vacation.startDate.month,
      vacation.startDate.day,
    );
    final end = DateTime(
      vacation.endDate.year,
      vacation.endDate.month,
      vacation.endDate.day,
    );
    while (!current.isAfter(end)) {
      map[current] = vacation;
      current = current.add(const Duration(days: 1));
    }
  }
  return map;
}

/// Next upcoming vacation (endDate >= today)
@riverpod
Vacation? nextVacation(Ref ref) {
  final vacationsAsync = ref.watch(dbVacationsProvider);
  final vacations = vacationsAsync.valueOrNull;
  if (vacations == null) return null;

  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final upcoming = vacations
      .where((v) =>
          !DateTime(v.endDate.year, v.endDate.month, v.endDate.day)
              .isBefore(today))
      .toList()
    ..sort((a, b) => a.startDate.compareTo(b.startDate));
  return upcoming.isEmpty ? null : upcoming.first;
}
