// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'month_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$monthNamesHash() => r'7a78b0ef5e7120c1f60c7302aac0fc49b44a699f';

/// See also [monthNames].
@ProviderFor(monthNames)
final monthNamesProvider = AutoDisposeProvider<List<String>>.internal(
  monthNames,
  name: r'monthNamesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$monthNamesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MonthNamesRef = AutoDisposeProviderRef<List<String>>;
String _$selectedMonthHash() => r'dca7a3bae447b9bcb92a8ced29a068014f84abd4';

/// See also [SelectedMonth].
@ProviderFor(SelectedMonth)
final selectedMonthProvider =
    AutoDisposeNotifierProvider<SelectedMonth, int>.internal(
      SelectedMonth.new,
      name: r'selectedMonthProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$selectedMonthHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedMonth = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
