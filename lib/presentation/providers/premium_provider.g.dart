// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'premium_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shouldShowAdsHash() => r'aa04e7c0ce73c8602c52394ad514a51c91ccab6c';

/// See also [shouldShowAds].
@ProviderFor(shouldShowAds)
final shouldShowAdsProvider = AutoDisposeProvider<bool>.internal(
  shouldShowAds,
  name: r'shouldShowAdsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shouldShowAdsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ShouldShowAdsRef = AutoDisposeProviderRef<bool>;
String _$premiumStatusHash() => r'7e209070667e04e1ad1583f66e0dfb9aa883a96c';

/// See also [PremiumStatus].
@ProviderFor(PremiumStatus)
final premiumStatusProvider =
    AutoDisposeAsyncNotifierProvider<PremiumStatus, bool>.internal(
      PremiumStatus.new,
      name: r'premiumStatusProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$premiumStatusHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PremiumStatus = AutoDisposeAsyncNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
