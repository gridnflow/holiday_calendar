import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'year_provider.g.dart';

@riverpod
class SelectedYear extends _$SelectedYear {
  @override
  int build() => DateTime.now().year;

  void select(int year) {
    state = year;
  }

  void nextYear() {
    state = state + 1;
  }

  void previousYear() {
    state = state - 1;
  }
}

@riverpod
List<int> availableYears(Ref ref) {
  final currentYear = DateTime.now().year;
  return List.generate(5, (index) => currentYear - 2 + index);
}
