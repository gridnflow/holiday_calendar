import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/presentation/providers/month_provider.dart';

class MonthSelector extends ConsumerWidget {
  const MonthSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMonth = ref.watch(selectedMonthProvider);
    final monthNames = ref.watch(monthNamesProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            ref.read(selectedMonthProvider.notifier).previousMonth();
          },
          icon: const Icon(Icons.chevron_left),
        ),
        DropdownButton<int>(
          value: selectedMonth,
          underline: const SizedBox.shrink(),
          items: List.generate(
            12,
            (index) => DropdownMenuItem<int>(
              value: index + 1,
              child: Text(
                monthNames[index],
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          onChanged: (value) {
            if (value != null) {
              ref.read(selectedMonthProvider.notifier).select(value);
            }
          },
        ),
        IconButton(
          onPressed: () {
            ref.read(selectedMonthProvider.notifier).nextMonth();
          },
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}
