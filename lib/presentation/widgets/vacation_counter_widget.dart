import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/presentation/providers/state_provider.dart';

/// Widget showing annual vacation days counter with edit functionality
class VacationCounterWidget extends ConsumerWidget {
  const VacationCounterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final total = ref.watch(annualVacationDaysProvider);
    final remaining = ref.watch(remainingVacationDaysProvider);
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.beach_access, color: theme.colorScheme.primary, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Mein Urlaubskonto',
                        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, size: 18),
                    onPressed: () => _showEditDialog(context, ref, total),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _CounterBox(
                      label: 'Gesamt',
                      value: total,
                      color: theme.colorScheme.surfaceContainerHighest,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _CounterBox(
                      label: 'Verfügbar',
                      value: remaining,
                      color: theme.colorScheme.primaryContainer,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _CounterBox(
                      label: 'Genutzt',
                      value: total - remaining,
                      color: theme.colorScheme.tertiaryContainer,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, WidgetRef ref, int current) {
    final controller = TextEditingController(text: current.toString());
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Urlaubstage eingeben'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Jährliche Urlaubstage',
            suffix: Text('Tage'),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Abbrechen'),
          ),
          FilledButton(
            onPressed: () {
              final value = int.tryParse(controller.text);
              if (value != null && value > 0 && value <= 365) {
                ref.read(annualVacationDaysProvider.notifier).set(value);
              }
              Navigator.pop(ctx);
            },
            child: const Text('Speichern'),
          ),
        ],
      ),
    );
  }
}

class _CounterBox extends StatelessWidget {
  final String label;
  final int value;
  final Color color;

  const _CounterBox({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            '$value',
            style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(label, style: theme.textTheme.labelSmall),
        ],
      ),
    );
  }
}
