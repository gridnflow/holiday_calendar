import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/domain/entities/federal_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state_provider.g.dart';

@riverpod
class SelectedFederalState extends _$SelectedFederalState {
  @override
  FederalState? build() => null;

  void select(FederalState? state) {
    this.state = state;
  }

  void clear() {
    state = null;
  }
}

@riverpod
List<FederalState> federalStates(Ref ref) {
  return FederalState.all;
}
