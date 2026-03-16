import 'package:flutter/foundation.dart';

class AdConstants {
  AdConstants._();

  static bool get isAdSupported {
    if (kIsWeb) return false;
    return defaultTargetPlatform == TargetPlatform.android;
  }

  static String get bannerAdUnitId {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return 'ca-app-pub-6139362725426823/5208063091';
    }
    return '';
  }

  static String get nativeAdUnitId {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return 'ca-app-pub-6139362725426823/3703409736';
    }
    return '';
  }

  // Android App ID: ca-app-pub-6139362725426823~2992119401
}
