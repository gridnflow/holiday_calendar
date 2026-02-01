// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'year_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$availableYearsHash() => r'0b97b3e733787696b4fa92e31e381d75737f13a9';

/// See also [availableYears].
@ProviderFor(availableYears)
final availableYearsProvider = AutoDisposeProvider<List<int>>.internal(
  availableYears,
  name: r'availableYearsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$availableYearsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AvailableYearsRef = AutoDisposeProviderRef<List<int>>;
String _$selectedYearHash() => r'7d886f976b21d24a3becdcec8a75d871b19d928e';

/// See also [SelectedYear].
@ProviderFor(SelectedYear)
final selectedYearProvider =
    AutoDisposeNotifierProvider<SelectedYear, int>.internal(
      SelectedYear.new,
      name: r'selectedYearProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$selectedYearHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedYear = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
