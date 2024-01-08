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
    apiKey: 'AIzaSyAT1-J6oIbSC9UqVGkNJybnrN5ntenkyEI',
    appId: '1:259809276514:web:e07e78bf9a3124f924d73b',
    messagingSenderId: '259809276514',
    projectId: 'projectweb-117ef',
    authDomain: 'projectweb-117ef.firebaseapp.com',
    storageBucket: 'projectweb-117ef.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyACxEeuIwOe2Qg3rYe2ra4RX6xG2hUnu3Y',
    appId: '1:259809276514:android:bd547fbe21a69f2a24d73b',
    messagingSenderId: '259809276514',
    projectId: 'projectweb-117ef',
    storageBucket: 'projectweb-117ef.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBXjSKdG2ojcGJ-OMN1_eZZ17zqYhxic4U',
    appId: '1:259809276514:ios:d1ce52b5e07593e824d73b',
    messagingSenderId: '259809276514',
    projectId: 'projectweb-117ef',
    storageBucket: 'projectweb-117ef.appspot.com',
    iosBundleId: 'com.example.flutterApplication2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBXjSKdG2ojcGJ-OMN1_eZZ17zqYhxic4U',
    appId: '1:259809276514:ios:a2b0ea86ff51ade924d73b',
    messagingSenderId: '259809276514',
    projectId: 'projectweb-117ef',
    storageBucket: 'projectweb-117ef.appspot.com',
    iosBundleId: 'com.example.flutterApplication2.RunnerTests',
  );
}