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
    apiKey: 'AIzaSyAHXaMEYTuUjRvXmEGFHJLSiSugLXkfSz4',
    appId: '1:693897128945:web:2d9a6b9119f0ead9717250',
    messagingSenderId: '693897128945',
    projectId: 'bmi-calculator-9fccb',
    authDomain: 'bmi-calculator-9fccb.firebaseapp.com',
    storageBucket: 'bmi-calculator-9fccb.appspot.com',
    measurementId: 'G-QFWQNV029Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAyKMdQbpKZi6Yr0A83wIt3rto_pyr0BcQ',
    appId: '1:693897128945:android:ba8dd129f758c5aa717250',
    messagingSenderId: '693897128945',
    projectId: 'bmi-calculator-9fccb',
    storageBucket: 'bmi-calculator-9fccb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBl3AeZ9Cf1oL6fCmi02zcTOF6DuBOGGsU',
    appId: '1:693897128945:ios:b5fa6c96d15a4f0e717250',
    messagingSenderId: '693897128945',
    projectId: 'bmi-calculator-9fccb',
    storageBucket: 'bmi-calculator-9fccb.appspot.com',
    iosBundleId: 'com.example.bimCalculator',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBl3AeZ9Cf1oL6fCmi02zcTOF6DuBOGGsU',
    appId: '1:693897128945:ios:6122af5ae1ecb63c717250',
    messagingSenderId: '693897128945',
    projectId: 'bmi-calculator-9fccb',
    storageBucket: 'bmi-calculator-9fccb.appspot.com',
    iosBundleId: 'com.example.bimCalculator.RunnerTests',
  );
}