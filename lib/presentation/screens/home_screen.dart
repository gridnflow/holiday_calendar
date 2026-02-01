import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/presentation/providers/holiday_provider.dart';
import 'package:holiday_calendar/presentation/screens/bridge_day_screen.dart';
import 'package:holiday_calendar/presentation/widgets/ads/banner_ad_widget.dart';
import 'package:holiday_calendar/presentation/widgets/calendar/holiday_calendar.dart';
import 'package:holiday_calendar/presentation/widgets/common/error_widget.dart';
import 'package:holiday_calendar/presentation/widgets/common/loading_shimmer.dart';
import 'package:holiday_calendar/presentation/widgets/month_selector.dart';
import 'package:holiday_calendar/presentation/widgets/state_selector.dart';
import 'package:holiday_calendar/presentation/widgets/year_selector.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final holidaysAsync = ref.watch(holidayNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Feiertage'),
        actions: [
          IconButton(
            icon: const Icon(Icons.beach_access),
            tooltip: 'Brückentage',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const BridgeDayScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(holidayNotifierProvider.notifier).refresh();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const StateSelector(),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Expanded(child: YearSelector()),
                    Expanded(child: MonthSelector()),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: holidaysAsync.when(
              data: (_) => const HolidayCalendar(),
              loading: () => const CalendarLoadingShimmer(),
              error: (error, _) => AppErrorWidget(
                message: error.toString(),
                onRetry: () {
                  ref.read(holidayNotifierProvider.notifier).refresh();
                },
              ),
            ),
          ),
          const SafeArea(
            top: false,
            child: AdContainer(
              child: BannerAdWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
