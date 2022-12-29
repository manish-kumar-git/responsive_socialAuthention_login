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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAgzoeOchLrVg0ym2Fvw_jN1Nes88Vxn9A',
    appId: '1:317934427709:web:c060022f01a1f58dfd1454',
    messagingSenderId: '317934427709',
    projectId: 'login-signup-fc712',
    authDomain: 'login-signup-fc712.firebaseapp.com',
    storageBucket: 'login-signup-fc712.appspot.com',
    measurementId: 'G-3BSQX4EB0D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA2BCBGSNadKUyfAsTtYMjjHHql44hlQRI',
    appId: '1:317934427709:android:13cdc418c87e338bfd1454',
    messagingSenderId: '317934427709',
    projectId: 'login-signup-fc712',
    storageBucket: 'login-signup-fc712.appspot.com',
  );
}