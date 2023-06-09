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
    apiKey: 'AIzaSyDLC4qftyiVDfYQCFbw3C0zKtsKHRY-euc',
    appId: '1:1046345405083:web:bddf8c59069092ecf9ac3e',
    messagingSenderId: '1046345405083',
    projectId: 'signintemplate-601ae',
    authDomain: 'signintemplate-601ae.firebaseapp.com',
    storageBucket: 'signintemplate-601ae.appspot.com',
    measurementId: 'G-VEZ6K7CHLL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCbLnUj6NwgE0vruGuG-PS90s0HrgmWlKY',
    appId: '1:1046345405083:android:661ef26c06c33583f9ac3e',
    messagingSenderId: '1046345405083',
    projectId: 'signintemplate-601ae',
    storageBucket: 'signintemplate-601ae.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTlXJ51JHc05N0OavJYltv4_SWimLUSZc',
    appId: '1:1046345405083:ios:0ada91c6b5b3ae02f9ac3e',
    messagingSenderId: '1046345405083',
    projectId: 'signintemplate-601ae',
    storageBucket: 'signintemplate-601ae.appspot.com',
    iosClientId: '1046345405083-9qk7s6b180nbhefv377rlosa4cu5ecf3.apps.googleusercontent.com',
    iosBundleId: 'com.example.signinTemplate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBTlXJ51JHc05N0OavJYltv4_SWimLUSZc',
    appId: '1:1046345405083:ios:0ada91c6b5b3ae02f9ac3e',
    messagingSenderId: '1046345405083',
    projectId: 'signintemplate-601ae',
    storageBucket: 'signintemplate-601ae.appspot.com',
    iosClientId: '1046345405083-9qk7s6b180nbhefv377rlosa4cu5ecf3.apps.googleusercontent.com',
    iosBundleId: 'com.example.signinTemplate',
  );
}
