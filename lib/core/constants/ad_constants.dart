import 'package:flutter/foundation.dart';

class AdConstants {
  AdConstants._();

  static bool get isAdSupported {
    if (kIsWeb) return false;
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  static String get bannerAdUnitId {
    if (kIsWeb) return '';
    if (defaultTargetPlatform == TargetPlatform.android) {
      return 'ca-app-pub-6139362725426823/5208063091';
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      // TODO: Replace with actual iOS Ad Unit ID
      return 'ca-app-pub-3940256099942544/2934735716';
    }
    return '';
  }

  static String get nativeAdUnitId {
    if (kIsWeb) return '';
    if (defaultTargetPlatform == TargetPlatform.android) {
      return 'ca-app-pub-6139362725426823/3703409736';
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return 'ca-app-pub-3940256099942544/3986624511';
    }
    return '';
  }

  // Android App ID: ca-app-pub-6139362725426823~2992119401
}
