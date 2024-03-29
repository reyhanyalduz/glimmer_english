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
    apiKey: 'AIzaSyB2JaXbeXpfLHGdG-WvcYWeqBHCbRtQzBk',
    appId: '1:102621104041:web:7bdedd9228b9cf39dea6b8',
    messagingSenderId: '102621104041',
    projectId: 'fir-ilkdeneme-01',
    authDomain: 'fir-ilkdeneme-01.firebaseapp.com',
    storageBucket: 'fir-ilkdeneme-01.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD1aRXREvcoUpmAN8pd0GPTrZDVd1S_PIg',
    appId: '1:102621104041:android:30c3484468810344dea6b8',
    messagingSenderId: '102621104041',
    projectId: 'fir-ilkdeneme-01',
    storageBucket: 'fir-ilkdeneme-01.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1tBvDTKXnyLBW2WbhUhCTRzZ9xHWTxgY',
    appId: '1:102621104041:ios:66a30e65ed5d9711dea6b8',
    messagingSenderId: '102621104041',
    projectId: 'fir-ilkdeneme-01',
    storageBucket: 'fir-ilkdeneme-01.appspot.com',
    iosBundleId: 'com.example.kelimeKartlari02',
  );
}
