// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDatabaseHash() => r'3a45fd58ddfbdc9ee2377249534ba8231737b935';

/// Database provider - singleton instance
///
/// Copied from [appDatabase].
@ProviderFor(appDatabase)
final appDatabaseProvider = Provider<AppDatabase>.internal(
  appDatabase,
  name: r'appDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppDatabaseRef = ProviderRef<AppDatabase>;
String _$holidayRemoteDataSourceHash() =>
    r'08f1e86a99c752aabff1ed6bf38d5e9393194a83';

/// Remote data source provider
///
/// Copied from [holidayRemoteDataSource].
@ProviderFor(holidayRemoteDataSource)
final holidayRemoteDataSourceProvider =
    AutoDisposeProvider<HolidayRemoteDataSource>.internal(
      holidayRemoteDataSource,
      name: r'holidayRemoteDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$holidayRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HolidayRemoteDataSourceRef =
    AutoDisposeProviderRef<HolidayRemoteDataSource>;
String _$holidayLocalDataSourceHash() =>
    r'ca9e88a64daaf7786ee7ee2cde5d9e265e45c6e2';

/// Local data source provider (Drift)
///
/// Copied from [holidayLocalDataSource].
@ProviderFor(holidayLocalDataSource)
final holidayLocalDataSourceProvider =
    AutoDisposeProvider<HolidayLocalDataSource>.internal(
      holidayLocalDataSource,
      name: r'holidayLocalDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$holidayLocalDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HolidayLocalDataSourceRef =
    AutoDisposeProviderRef<HolidayLocalDataSource>;
String _$holidayRepositoryHash() => r'1f86983361bc8bff9651a71974890083bdcafa42';

/// Repository provider with offline-first strategy
///
/// Copied from [holidayRepository].
@ProviderFor(holidayRepository)
final holidayRepositoryProvider =
    AutoDisposeProvider<HolidayRepository>.internal(
      holidayRepository,
      name: r'holidayRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$holidayRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HolidayRepositoryRef = AutoDisposeProviderRef<HolidayRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
