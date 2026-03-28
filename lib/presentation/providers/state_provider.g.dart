// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$federalStatesHash() => r'6a0808f8754ae65ffc7a70364d4edabdd0413fdc';

/// See also [federalStates].
@ProviderFor(federalStates)
final federalStatesProvider = AutoDisposeProvider<List<FederalState>>.internal(
  federalStates,
  name: r'federalStatesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$federalStatesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FederalStatesRef = AutoDisposeProviderRef<List<FederalState>>;
String _$usedVacationDaysHash() => r'56ff7e407c3471c2feb514955060c06d94c1da11';

/// See also [usedVacationDays].
@ProviderFor(usedVacationDays)
final usedVacationDaysProvider = AutoDisposeProvider<int>.internal(
  usedVacationDays,
  name: r'usedVacationDaysProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$usedVacationDaysHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UsedVacationDaysRef = AutoDisposeProviderRef<int>;
String _$remainingVacationDaysHash() =>
    r'527ca4fb8c984387c375bf9c08f82fc19a145fcc';

/// See also [remainingVacationDays].
@ProviderFor(remainingVacationDays)
final remainingVacationDaysProvider = AutoDisposeProvider<int>.internal(
  remainingVacationDays,
  name: r'remainingVacationDaysProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$remainingVacationDaysHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RemainingVacationDaysRef = AutoDisposeProviderRef<int>;
String _$selectedFederalStateHash() =>
    r'0ac956625792b12fb4f7d73c15930ec53949fdd8';

/// See also [SelectedFederalState].
@ProviderFor(SelectedFederalState)
final selectedFederalStateProvider =
    AutoDisposeNotifierProvider<SelectedFederalState, FederalState?>.internal(
      SelectedFederalState.new,
      name: r'selectedFederalStateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$selectedFederalStateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedFederalState = AutoDisposeNotifier<FederalState?>;
String _$annualVacationDaysHash() =>
    r'd791c5e936fec2e477e23d3d79eac824e243c9ec';

/// See also [AnnualVacationDays].
@ProviderFor(AnnualVacationDays)
final annualVacationDaysProvider =
    AutoDisposeNotifierProvider<AnnualVacationDays, int>.internal(
      AnnualVacationDays.new,
      name: r'annualVacationDaysProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$annualVacationDaysHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AnnualVacationDays = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
