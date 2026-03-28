import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:holiday_calendar/domain/repositories/holiday_repository.dart';
import 'package:holiday_calendar/presentation/providers/repository_provider.dart';

/// Helper to pump a widget wrapped in MaterialApp + ProviderScope
/// with optional provider overrides
Future<void> pumpApp(
  WidgetTester tester,
  Widget widget, {
  List<Override> overrides = const [],
  Size screenSize = const Size(1080, 1920),
}) async {
  tester.view.physicalSize = screenSize;
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  await tester.pumpWidget(
    ProviderScope(
      overrides: overrides,
      child: MaterialApp(
        home: widget,
      ),
    ),
  );
}

/// Creates a provider override that replaces the HolidayRepository
Override overrideRepository(HolidayRepository repository) {
  return holidayRepositoryProvider.overrideWith((ref) => repository);
}
