// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyAOMjpUx9l7Iwqt6WoZbQI2NSE7a0O4Wr4',
    appId: '1:904827067787:web:f0d6f8acd87b5d614de38e',
    messagingSenderId: '904827067787',
    projectId: 'auth-6299f',
    authDomain: 'auth-6299f.firebaseapp.com',
    storageBucket: 'auth-6299f.firebasestorage.app',
    measurementId: 'G-PY8X27M0WV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBnzOwQvYh3EOSsJxLTP7lHr_nDV5ddOeQ',
    appId: '1:904827067787:android:dbd9e3a33ad435694de38e',
    messagingSenderId: '904827067787',
    projectId: 'auth-6299f',
    storageBucket: 'auth-6299f.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAM2EqnnVuobDmyO-NuOdx2wV7Sw-bRUaU',
    appId: '1:904827067787:ios:5e299f1da45aa6944de38e',
    messagingSenderId: '904827067787',
    projectId: 'auth-6299f',
    storageBucket: 'auth-6299f.firebasestorage.app',
    iosBundleId: 'com.example.firebaseauth',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAOMjpUx9l7Iwqt6WoZbQI2NSE7a0O4Wr4',
    appId: '1:904827067787:web:426f46f3feeb9b824de38e',
    messagingSenderId: '904827067787',
    projectId: 'auth-6299f',
    authDomain: 'auth-6299f.firebaseapp.com',
    storageBucket: 'auth-6299f.firebasestorage.app',
    measurementId: 'G-L1EFZD9XJ6',
  );
}