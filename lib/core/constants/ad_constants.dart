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
      // Test Ad Unit ID for Android
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      // Test Ad Unit ID for iOS
      return 'ca-app-pub-3940256099942544/2934735716';
    }
    return '';
  }

  static String get nativeAdUnitId {
    if (kIsWeb) return '';
    if (defaultTargetPlatform == TargetPlatform.android) {
      return 'ca-app-pub-3940256099942544/2247696110';
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return 'ca-app-pub-3940256099942544/3986624511';
    }
    return '';
  }

  // TODO: Replace with your actual AdMob App ID before release
  // Android: ca-app-pub-XXXXXXXXXXXXXXXX~XXXXXXXXXX
  // iOS: ca-app-pub-XXXXXXXXXXXXXXXX~XXXXXXXXXX
}
