import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/presentation/providers/holiday_provider.dart';
import 'package:holiday_calendar/presentation/screens/bridge_day_screen.dart';
import 'package:holiday_calendar/presentation/screens/notification_settings_screen.dart';
import 'package:holiday_calendar/presentation/screens/year_overview_screen.dart';
import 'package:holiday_calendar/presentation/widgets/ads/banner_ad_widget.dart';
import 'package:holiday_calendar/presentation/widgets/ads/native_ad_widget.dart';
import 'package:holiday_calendar/presentation/widgets/bridge_day_preview.dart';
import 'package:holiday_calendar/presentation/widgets/calendar/holiday_calendar.dart';
import 'package:holiday_calendar/presentation/widgets/common/error_widget.dart';
import 'package:holiday_calendar/presentation/widgets/common/loading_shimmer.dart';
import 'package:holiday_calendar/presentation/widgets/filter_bar.dart';
import 'package:holiday_calendar/presentation/widgets/vacation_efficiency_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void _showDisclaimerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Über diese App'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '⚠️ WICHTIGE INFORMATIONEN',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Diese App ist KEINE offizielle Regierungsanwendung und steht in keiner Verbindung zu staatlichen Stellen. '
                'Es handelt sich um ein unabhängiges, privates Informationsangebot. '
                'Für verbindliche Informationen wenden Sie sich bitte direkt an die zuständigen Behörden.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Datenquelle',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Die Feiertagsdaten basieren auf offiziellen gesetzlichen Regelungen der Bundesrepublik Deutschland. '
                'Maßgebliche Quellen sind:',
              ),
              const SizedBox(height: 8),
              _SourceLink(
                label: 'BMI – Nationale Feiertage',
                url: 'https://www.bmi.bund.de/DE/themen/verfassung/staatliche-symbole/nationale-feiertage/nationale-feiertage-node.html',
              ),
              const SizedBox(height: 16),
              const Text(
                'Technische Umsetzung',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Zur technischen Bereitstellung der Daten wird die OpenHolidays API genutzt, '
                'die Feiertagsinformationen aus den oben genannten offiziellen Quellen aggregiert.',
              ),
              const SizedBox(height: 8),
              _SourceLink(
                label: 'OpenHolidays API',
                url: 'https://www.openholidaysapi.org/en/',
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => launchUrl(
              Uri.parse('https://yeonghub.github.io/holiday_calendar/privacy-policy.html'),
              mode: LaunchMode.externalApplication,
            ),
            child: const Text('Datenschutz'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Schließen'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final holidaysAsync = ref.watch(holidayNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Feiertage'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_view_month),
            tooltip: 'Jahresübersicht',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const YearOverviewScreen()),
              );
            },
          ),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const NotificationSettingsScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Über diese App',
            onPressed: () => _showDisclaimerDialog(context),
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
                    const NativeAdWidget(),
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

class _SourceLink extends StatelessWidget {
  const _SourceLink({required this.label, required this.url});

  final String label;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
        child: Text(
          label,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
