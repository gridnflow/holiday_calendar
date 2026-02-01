import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'month_provider.g.dart';

@riverpod
class SelectedMonth extends _$SelectedMonth {
  @override
  int build() => DateTime.now().month;

  void select(int month) {
    state = month;
  }

  void nextMonth() {
    state = state < 12 ? state + 1 : 1;
  }

  void previousMonth() {
    state = state > 1 ? state - 1 : 12;
  }
}

@riverpod
List<String> monthNames(Ref ref) {
  return [
    'Januar',
    'Februar',
    'März',
    'April',
    'Mai',
    'Juni',
    'Juli',
    'August',
    'September',
    'Oktober',
    'November',
    'Dezember',
  ];
}
