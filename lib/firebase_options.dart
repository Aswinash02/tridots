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
    apiKey: 'AIzaSyBucdgkjfXrbBscKhG1ZzD_Zl_zl8kQPfw',
    appId: '1:13442371186:web:6a7069e1956b70e6edfceb',
    messagingSenderId: '13442371186',
    projectId: 'tridots-a114c',
    authDomain: 'tridots-a114c.firebaseapp.com',
    storageBucket: 'tridots-a114c.appspot.com',
    measurementId: 'G-FRQMM2PXFH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmfyaKnbKbN94OUKRXh3nNYVa4VxrzUU8',
    appId: '1:13442371186:android:2a71cc512412ce23edfceb',
    messagingSenderId: '13442371186',
    projectId: 'tridots-a114c',
    storageBucket: 'tridots-a114c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDoXAThFO55RVpVdkMM-MpIa52yUGy6otY',
    appId: '1:13442371186:ios:21bb193733842e18edfceb',
    messagingSenderId: '13442371186',
    projectId: 'tridots-a114c',
    storageBucket: 'tridots-a114c.appspot.com',
    iosBundleId: 'com.example.tridots',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDoXAThFO55RVpVdkMM-MpIa52yUGy6otY',
    appId: '1:13442371186:ios:21bb193733842e18edfceb',
    messagingSenderId: '13442371186',
    projectId: 'tridots-a114c',
    storageBucket: 'tridots-a114c.appspot.com',
    iosBundleId: 'com.example.tridots',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBucdgkjfXrbBscKhG1ZzD_Zl_zl8kQPfw',
    appId: '1:13442371186:web:31f394dc4f93e5e6edfceb',
    messagingSenderId: '13442371186',
    projectId: 'tridots-a114c',
    authDomain: 'tridots-a114c.firebaseapp.com',
    storageBucket: 'tridots-a114c.appspot.com',
    measurementId: 'G-XCW6JMB438',
  );
}
