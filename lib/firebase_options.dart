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
        return macos;
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
    apiKey: 'AIzaSyBn-QuQQz5W0snLfaNJQjSLPsjSL3R_v50',
    appId: '1:967363186288:web:9e5ee02e256ba1ecb62eb5',
    messagingSenderId: '967363186288',
    projectId: 'coffeeshopapp-main',
    authDomain: 'coffeeshopapp-main.firebaseapp.com',
    storageBucket: 'coffeeshopapp-main.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC_vaLl3Y91TZrYpFwDyt9nBzhtbHzcO4M',
    appId: '1:967363186288:android:1e8406b16b34bd45b62eb5',
    messagingSenderId: '967363186288',
    projectId: 'coffeeshopapp-main',
    storageBucket: 'coffeeshopapp-main.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDGkEjzLv1RpzxMuPCiXJfl8gW-qCATils',
    appId: '1:967363186288:ios:3651987317014f3cb62eb5',
    messagingSenderId: '967363186288',
    projectId: 'coffeeshopapp-main',
    storageBucket: 'coffeeshopapp-main.firebasestorage.app',
    iosBundleId: 'com.alexmarcus.coffeeshopapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDGkEjzLv1RpzxMuPCiXJfl8gW-qCATils',
    appId: '1:967363186288:ios:e0933c99a68b079bb62eb5',
    messagingSenderId: '967363186288',
    projectId: 'coffeeshopapp-main',
    storageBucket: 'coffeeshopapp-main.firebasestorage.app',
    iosBundleId: 'com.example.coffeeshopapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBn-QuQQz5W0snLfaNJQjSLPsjSL3R_v50',
    appId: '1:967363186288:web:752aff7769a3aa95b62eb5',
    messagingSenderId: '967363186288',
    projectId: 'coffeeshopapp-main',
    authDomain: 'coffeeshopapp-main.firebaseapp.com',
    storageBucket: 'coffeeshopapp-main.firebasestorage.app',
  );
}
