import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/presentation/providers/year_provider.dart';

class YearSelector extends ConsumerWidget {
  const YearSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedYear = ref.watch(selectedYearProvider);
    final availableYears = ref.watch(availableYearsProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            ref.read(selectedYearProvider.notifier).previousYear();
          },
          icon: const Icon(Icons.chevron_left),
        ),
        DropdownButton<int>(
          value: selectedYear,
          underline: const SizedBox.shrink(),
          items: availableYears
              .map(
                (year) => DropdownMenuItem<int>(
                  value: year,
                  child: Text(
                    year.toString(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value != null) {
              ref.read(selectedYearProvider.notifier).select(value);
            }
          },
        ),
        IconButton(
          onPressed: () {
            ref.read(selectedYearProvider.notifier).nextYear();
          },
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}
