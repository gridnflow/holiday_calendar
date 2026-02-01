import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/domain/entities/federal_state.dart';
import 'package:holiday_calendar/presentation/providers/state_provider.dart';

class StateSelector extends ConsumerWidget {
  const StateSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedState = ref.watch(selectedFederalStateProvider);
    final states = ref.watch(federalStatesProvider);

    return InputDecorator(
      decoration: InputDecoration(
        labelText: 'Bundesland',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<FederalState?>(
          value: selectedState,
          isExpanded: true,
          isDense: true,
          items: [
            const DropdownMenuItem<FederalState?>(
              value: null,
              child: Text('Alle Bundesländer'),
            ),
            ...states.map(
              (state) => DropdownMenuItem<FederalState>(
                value: state,
                child: Text(state.nameDE),
              ),
            ),
          ],
          onChanged: (value) {
            ref.read(selectedFederalStateProvider.notifier).select(value);
          },
        ),
      ),
    );
  }
}
