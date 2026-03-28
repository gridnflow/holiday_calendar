// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_vacation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dbVacationsHash() => r'a43f04dc1b50c66d42d580c69b9899f74775f5cf';

/// See also [dbVacations].
@ProviderFor(dbVacations)
final dbVacationsProvider = AutoDisposeStreamProvider<List<Vacation>>.internal(
  dbVacations,
  name: r'dbVacationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dbVacationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DbVacationsRef = AutoDisposeStreamProviderRef<List<Vacation>>;
String _$dbVacationsByDateHash() => r'aab1c9803bbc60c705398d63cc95aed33ee2ee1b';

/// Map of date → vacation for quick lookup (all dates in range)
///
/// Copied from [dbVacationsByDate].
@ProviderFor(dbVacationsByDate)
final dbVacationsByDateProvider =
    AutoDisposeProvider<Map<DateTime, Vacation>>.internal(
      dbVacationsByDate,
      name: r'dbVacationsByDateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$dbVacationsByDateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DbVacationsByDateRef = AutoDisposeProviderRef<Map<DateTime, Vacation>>;
String _$nextVacationHash() => r'd336cc6f8fdd3f5e73fc85c649ce6cb793454e29';

/// Next upcoming vacation (endDate >= today)
///
/// Copied from [nextVacation].
@ProviderFor(nextVacation)
final nextVacationProvider = AutoDisposeProvider<Vacation?>.internal(
  nextVacation,
  name: r'nextVacationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$nextVacationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NextVacationRef = AutoDisposeProviderRef<Vacation?>;
String _$vacationNotifierHash() => r'ceb1d8e0586bb8f6deac95541a338c4baf266d4a';

/// See also [VacationNotifier].
@ProviderFor(VacationNotifier)
final vacationNotifierProvider =
    AutoDisposeAsyncNotifierProvider<VacationNotifier, void>.internal(
      VacationNotifier.new,
      name: r'vacationNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$vacationNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$VacationNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
