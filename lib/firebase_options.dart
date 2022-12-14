// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCHKwmTLAU16n0DvQwcb9k6cg31Mo_eMgI',
    appId: '1:526226780916:web:0da08cc03aa4b6f7f1a4a1',
    messagingSenderId: '526226780916',
    projectId: 'whisperp-88949',
    authDomain: 'whisperp-88949.firebaseapp.com',
    storageBucket: 'whisperp-88949.appspot.com',
    measurementId: 'G-XF6W0BNYE3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyABk_a1m3zFUsYlwgpLX3ZOVIi8Ag0UkVY',
    appId: '1:526226780916:android:c027ae9bef6adcd2f1a4a1',
    messagingSenderId: '526226780916',
    projectId: 'whisperp-88949',
    storageBucket: 'whisperp-88949.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBjONuN0x8ChbGq_OIiv-ZN46Xk9LHTSNc',
    appId: '1:526226780916:ios:60c9cd7a18667a9cf1a4a1',
    messagingSenderId: '526226780916',
    projectId: 'whisperp-88949',
    storageBucket: 'whisperp-88949.appspot.com',
    iosClientId: '526226780916-e873imomeq86sh3k6m8eu3rn1c3tqp65.apps.googleusercontent.com',
    iosBundleId: 'com.example.ndtmExamples',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBjONuN0x8ChbGq_OIiv-ZN46Xk9LHTSNc',
    appId: '1:526226780916:ios:60c9cd7a18667a9cf1a4a1',
    messagingSenderId: '526226780916',
    projectId: 'whisperp-88949',
    storageBucket: 'whisperp-88949.appspot.com',
    iosClientId: '526226780916-e873imomeq86sh3k6m8eu3rn1c3tqp65.apps.googleusercontent.com',
    iosBundleId: 'com.example.ndtmExamples',
  );
}
