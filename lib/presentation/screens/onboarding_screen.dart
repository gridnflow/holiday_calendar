import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holiday_calendar/core/services/analytics_service.dart';
import 'package:holiday_calendar/core/services/notification_service.dart';
import 'package:holiday_calendar/domain/entities/federal_state.dart';
import 'package:holiday_calendar/presentation/providers/notification_provider.dart';
import 'package:holiday_calendar/presentation/providers/school_holiday_provider.dart';
import 'package:holiday_calendar/presentation/providers/state_provider.dart';
import 'package:holiday_calendar/presentation/providers/vacation_provider.dart';
import 'package:holiday_calendar/presentation/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _onboardingCompleteKey = 'onboarding_complete';

Future<bool> isOnboardingComplete() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(_onboardingCompleteKey) ?? false;
}

Future<void> _markOnboardingComplete() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(_onboardingCompleteKey, true);
}

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Screen 2 state
  FederalState? _selectedState;

  // Screen 3 state
  int _vacationDays = 30;
  bool _notificationsEnabled = false;
  bool _showSchoolHolidays = true;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _completeOnboarding() async {
    // Save federal state selection
    if (_selectedState != null) {
      ref.read(selectedFederalStateProvider.notifier).select(_selectedState);
    }

    // Save vacation days
    await ref.read(vacationSettingsProvider.notifier).setTotalDays(_vacationDays);

    // Save school holiday preference
    ref.read(showSchoolHolidaysProvider.notifier).toggle(_showSchoolHolidays);

    // Save notification preference and schedule onboarding sequence
    if (_notificationsEnabled) {
      ref
          .read(notificationSettingsProvider.notifier)
          .setBrueckentagEnabled(true);

      // Schedule D+1, D+3, D+7 smart notification sequence
      await NotificationService().scheduleOnboardingSequence(
        daysUntilNextHoliday: 30,
        remainingBridgeDays: 10,
        nextHolidayDate: '',
        nextHolidayName: 'Feiertag',
        bundeslandName: _selectedState?.nameDE,
      );
    }

    // Log analytics event
    AnalyticsService().logOnboardingCompleted(
      bundesland: _selectedState?.nameDE ?? 'Alle',
      notificationsEnabled: _notificationsEnabled,
      vacationDays: _vacationDays,
    );

    // Mark onboarding as complete
    await _markOnboardingComplete();

    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Page indicator
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: List.generate(3, (index) {
                  return Expanded(
                    child: Container(
                      height: 4,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: index <= _currentPage
                            ? theme.colorScheme.primary
                            : theme.colorScheme.outline.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                }),
              ),
            ),
            // Pages
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (page) {
                  setState(() => _currentPage = page);
                },
                children: [
                  _ValuePropositionPage(onNext: _nextPage),
                  _StateSelectionPage(
                    selectedState: _selectedState,
                    onStateSelected: (state) {
                      setState(() => _selectedState = state);
                    },
                    onNext: _nextPage,
                  ),
                  _VacationAndNotificationPage(
                    vacationDays: _vacationDays,
                    onVacationDaysChanged: (days) {
                      setState(() => _vacationDays = days);
                    },
                    notificationsEnabled: _notificationsEnabled,
                    onNotificationsChanged: (enabled) {
                      setState(() => _notificationsEnabled = enabled);
                    },
                    showSchoolHolidays: _showSchoolHolidays,
                    onShowSchoolHolidaysChanged: (value) {
                      setState(() => _showSchoolHolidays = value);
                    },
                    onComplete: _completeOnboarding,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Screen 1: Value Proposition ---

class _ValuePropositionPage extends StatelessWidget {
  final VoidCallback onNext;

  const _ValuePropositionPage({required this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Icon(
            Icons.beach_access,
            size: 80,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(height: 32),
          Text(
            '1 Tag Urlaub.\n4 Tage frei.',
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Finde die besten Brückentage in deinem Bundesland und maximiere deinen Urlaub.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 48),
          // Feature highlights
          _FeatureRow(
            icon: Icons.calendar_today,
            text: 'Alle Feiertage auf einen Blick',
          ),
          const SizedBox(height: 16),
          _FeatureRow(
            icon: Icons.auto_awesome,
            text: 'Smarte Brückentage-Empfehlungen',
          ),
          const SizedBox(height: 16),
          _FeatureRow(
            icon: Icons.notifications_active,
            text: 'Erinnerungen vor Brückentagen',
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: onNext,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Los geht\'s'),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FeatureRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, color: theme.colorScheme.primary, size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Text(text, style: theme.textTheme.bodyLarge),
        ),
      ],
    );
  }
}

// --- Screen 2: Federal State Selection ---

class _StateSelectionPage extends StatelessWidget {
  final FederalState? selectedState;
  final ValueChanged<FederalState?> onStateSelected;
  final VoidCallback onNext;

  const _StateSelectionPage({
    required this.selectedState,
    required this.onStateSelected,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final states = FederalState.all;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
          child: Column(
            children: [
              Icon(
                Icons.location_on,
                size: 48,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text(
                'Dein Bundesland',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Feiertage unterscheiden sich je nach Bundesland. Wähle deins aus.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: states.length,
            itemBuilder: (context, index) {
              final state = states[index];
              final isSelected = selectedState == state;
              return Card(
                elevation: isSelected ? 2 : 0,
                color: isSelected
                    ? theme.colorScheme.primaryContainer
                    : theme.colorScheme.surface,
                child: ListTile(
                  leading: Icon(
                    isSelected
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    color: isSelected
                        ? theme.colorScheme.primary
                        : theme.colorScheme.outline,
                  ),
                  title: Text(
                    state.nameDE,
                    style: TextStyle(
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  onTap: () => onStateSelected(state),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(32),
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: selectedState != null ? onNext : null,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Weiter'),
            ),
          ),
        ),
      ],
    );
  }
}

// --- Screen 3: Vacation Days + Notification Opt-in ---

class _VacationAndNotificationPage extends StatelessWidget {
  final int vacationDays;
  final ValueChanged<int> onVacationDaysChanged;
  final bool notificationsEnabled;
  final ValueChanged<bool> onNotificationsChanged;
  final bool showSchoolHolidays;
  final ValueChanged<bool> onShowSchoolHolidaysChanged;
  final VoidCallback onComplete;

  const _VacationAndNotificationPage({
    required this.vacationDays,
    required this.onVacationDaysChanged,
    required this.notificationsEnabled,
    required this.onNotificationsChanged,
    required this.showSchoolHolidays,
    required this.onShowSchoolHolidaysChanged,
    required this.onComplete,
  });

  Future<void> _toggleNotifications(bool value) async {
    if (value) {
      final granted = await NotificationService().requestPermissions();
      onNotificationsChanged(granted);
    } else {
      onNotificationsChanged(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Icon(
            Icons.tune,
            size: 48,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Fast fertig!',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),

          // Vacation days input
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.flight_takeoff,
                          color: theme.colorScheme.primary),
                      const SizedBox(width: 12),
                      Text(
                        'Urlaubstage pro Jahr',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Wie viele Urlaubstage hast du?',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton.filled(
                        onPressed: vacationDays > 10
                            ? () => onVacationDaysChanged(vacationDays - 1)
                            : null,
                        icon: const Icon(Icons.remove),
                      ),
                      const SizedBox(width: 24),
                      Text(
                        '$vacationDays',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      const SizedBox(width: 24),
                      IconButton.filled(
                        onPressed: vacationDays < 45
                            ? () => onVacationDaysChanged(vacationDays + 1)
                            : null,
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Notification opt-in
          Card(
            child: SwitchListTile(
              secondary: Icon(
                notificationsEnabled
                    ? Icons.notifications_active
                    : Icons.notifications_outlined,
                color: notificationsEnabled
                    ? theme.colorScheme.primary
                    : theme.colorScheme.outline,
              ),
              title: const Text('Brückentage Erinnerungen'),
              subtitle: const Text(
                'Werde vor optimalen Brückentagen benachrichtigt',
              ),
              value: notificationsEnabled,
              onChanged: _toggleNotifications,
            ),
          ),

          const SizedBox(height: 16),

          // Schulferien toggle
          Card(
            child: SwitchListTile(
              secondary: Icon(
                Icons.school_outlined,
                color: showSchoolHolidays
                    ? theme.colorScheme.secondary
                    : theme.colorScheme.outline,
              ),
              title: const Text('Schulferien anzeigen'),
              subtitle: const Text(
                'Schulferien deines Bundeslandes im Kalender',
              ),
              value: showSchoolHolidays,
              onChanged: onShowSchoolHolidaysChanged,
            ),
          ),

          const SizedBox(height: 32),

          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: onComplete,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Fertig'),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
