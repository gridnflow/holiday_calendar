import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:holiday_calendar/app.dart';

void main() {
  testWidgets('App renders HomeScreen', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: HolidayCalendarApp(),
      ),
    );

    expect(find.text('Feiertage'), findsOneWidget);
  });
}
