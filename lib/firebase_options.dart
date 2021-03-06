// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBqwgfaHazLjqWIwwkSOFbZQXFi6yVwDx8',
    appId: '1:982143207800:web:471a25554b7b472bf5a08d',
    messagingSenderId: '982143207800',
    projectId: 'drixion-a5be1',
    authDomain: 'drixion-a5be1.firebaseapp.com',
    storageBucket: 'drixion-a5be1.appspot.com',
    measurementId: 'G-2EY27TQRPG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDs_wqEGWz-lNa1FhzODG0ERuteX_Qjldw',
    appId: '1:982143207800:android:ed555eacebf4a394f5a08d',
    messagingSenderId: '982143207800',
    projectId: 'drixion-a5be1',
    storageBucket: 'drixion-a5be1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCYzDu7y7qK8Rpr-NgZIVEge_y3YaK89Lw',
    appId: '1:982143207800:ios:3407ca11250cb969f5a08d',
    messagingSenderId: '982143207800',
    projectId: 'drixion-a5be1',
    storageBucket: 'drixion-a5be1.appspot.com',
    iosClientId: '982143207800-btm6amot7nvnupmbcidupc22o9u9abbb.apps.googleusercontent.com',
    iosBundleId: 'com.carmarket.drixion',
  );
}
