// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appLocaleHash() => r'ba070076e1ea415351a24a1a93e1f7ec08c105a4';

/// The user's chosen app locale.
///
/// `null` means "follow the system language" — the default, and what
/// `MaterialApp.locale` should be set to so Flutter resolves against the
/// device locale. A non-null value forces that language regardless of the
/// device setting. Persisted across launches via SharedPreferences.
///
/// Copied from [AppLocale].
@ProviderFor(AppLocale)
final appLocaleProvider =
    AutoDisposeNotifierProvider<AppLocale, Locale?>.internal(
      AppLocale.new,
      name: r'appLocaleProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$appLocaleHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AppLocale = AutoDisposeNotifier<Locale?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
