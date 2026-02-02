import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'vacation_provider.g.dart';

const String _totalVacationDaysKey = 'total_vacation_days';
const String _usedVacationDaysKey = 'used_vacation_days';
const String _resturlaubReminderKey = 'resturlaub_reminder';

/// Vacation days settings with persistence
@riverpod
class VacationSettings extends _$VacationSettings {
  @override
  Future<VacationData> build() async {
    final prefs = await SharedPreferences.getInstance();
    return VacationData(
      totalDays: prefs.getInt(_totalVacationDaysKey) ?? 30,
      usedDays: prefs.getInt(_usedVacationDaysKey) ?? 0,
      resturlaubReminder: prefs.getBool(_resturlaubReminderKey) ?? false,
    );
  }

  Future<void> setTotalDays(int days) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_totalVacationDaysKey, days);
    ref.invalidateSelf();
  }

  Future<void> setUsedDays(int days) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_usedVacationDaysKey, days);
    ref.invalidateSelf();
  }

  Future<void> addUsedDays(int days) async {
    final current = await future;
    await setUsedDays(current.usedDays + days);
  }

  Future<void> setResturlaubReminder(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_resturlaubReminderKey, enabled);
    ref.invalidateSelf();
  }

  Future<void> resetYear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_usedVacationDaysKey, 0);
    ref.invalidateSelf();
  }
}

/// Vacation data model
class VacationData {
  final int totalDays;
  final int usedDays;
  final bool resturlaubReminder;

  const VacationData({
    required this.totalDays,
    required this.usedDays,
    required this.resturlaubReminder,
  });

  int get remainingDays => totalDays - usedDays;
  double get usagePercentage => totalDays > 0 ? usedDays / totalDays : 0;
}
