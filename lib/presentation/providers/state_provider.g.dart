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
String _$selectedFederalStateHash() =>
    r'244b7999f65bf216607ce55e912537310db88022';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
