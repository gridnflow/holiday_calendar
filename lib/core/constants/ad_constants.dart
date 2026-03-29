import 'package:flutter/foundation.dart';

class AdConstants {
  AdConstants._();

  static bool get isAdSupported {
    if (kIsWeb) return false;
    return defaultTargetPlatform == TargetPlatform.android;
  }

  static String get bannerAdUnitId {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return const String.fromEnvironment('ADMOB_BANNER_ID');
    }
    return '';
  }

  static String get nativeAdUnitId {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return const String.fromEnvironment('ADMOB_NATIVE_ID');
    }
    return '';
  }
}
