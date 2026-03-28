// THIS FILE IS A PLACEHOLDER.
// Run `dart pub global run flutterfire_cli:flutterfire configure` to regenerate
// with real values. This file will be overwritten automatically.

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError('Web is not supported.');
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBKvVgmMkqLOLmZnlhRwPP5o_90X1SEOy8',
    appId: '1:122962723732:android:bd051b5c526c8e76f20581',
    messagingSenderId: '122962723732',
    projectId: 'flutter-todo-2026',
    storageBucket: 'flutter-todo-2026.firebasestorage.app',
  );

  // Replace with real values from `flutterfire configure`
}