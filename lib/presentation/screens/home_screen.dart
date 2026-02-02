import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/presentation/providers/holiday_provider.dart';
import 'package:holiday_calendar/presentation/screens/bridge_day_screen.dart';
import 'package:holiday_calendar/presentation/widgets/ads/banner_ad_widget.dart';
import 'package:holiday_calendar/presentation/widgets/bridge_day_preview.dart';
import 'package:holiday_calendar/presentation/widgets/calendar/holiday_calendar.dart';
import 'package:holiday_calendar/presentation/widgets/common/error_widget.dart';
import 'package:holiday_calendar/presentation/widgets/common/loading_shimmer.dart';
import 'package:holiday_calendar/presentation/widgets/filter_bar.dart';
import 'package:holiday_calendar/presentation/widgets/vacation_efficiency_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final holidaysAsync = ref.watch(holidayNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Feiertage'),
        centerTitle: true,
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
            icon: const Icon(Icons.notifications_outlined),
            tooltip: 'Benachrichtigungen',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Benachrichtigungen coming soon'),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const FilterBar(),
          Expanded(
            child: holidaysAsync.when(
              data: (_) => SingleChildScrollView(
                child: Column(
                  children: [
                    const HolidayCalendar(),
                    const Divider(height: 1),
                    // Brückentage Preview (horizontal scrolling cards)
                    const BridgeDayPreview(),
                    // Vacation counter & efficiency index
                    const VacationEfficiencyWidget(),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              loading: () => const CalendarLoadingShimmer(),
              error: (error, _) => AppErrorWidget(
                message: error.toString(),
                onRetry: () {
                  ref.read(holidayNotifierProvider.notifier).refresh();
                },
              ),
            ),
          ),
          const AdBannerContainer(),
        ],
      ),
    );
  }
}
