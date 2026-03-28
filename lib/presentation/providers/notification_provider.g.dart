// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationsSupportedHash() =>
    r'ecb3dd1d40b6e54371095c51b650576096d62c00';

/// Provider to check if notifications are supported
///
/// Copied from [notificationsSupported].
@ProviderFor(notificationsSupported)
final notificationsSupportedProvider = AutoDisposeProvider<bool>.internal(
  notificationsSupported,
  name: r'notificationsSupportedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationsSupportedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NotificationsSupportedRef = AutoDisposeProviderRef<bool>;
String _$notificationSettingsHash() =>
    r'35b7dedcbb59b2c354271f122dc7cfc15bc82af1';

/// Notification settings with persistence
///
/// Copied from [NotificationSettings].
@ProviderFor(NotificationSettings)
final notificationSettingsProvider =
    AutoDisposeAsyncNotifierProvider<
      NotificationSettings,
      NotificationSettingsData
    >.internal(
      NotificationSettings.new,
      name: r'notificationSettingsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$notificationSettingsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$NotificationSettings =
    AutoDisposeAsyncNotifier<NotificationSettingsData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
