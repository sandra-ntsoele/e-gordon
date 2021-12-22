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
    apiKey: 'AIzaSyCrdAXFBo3ee8j8-w6Aug9R-LKrHPDJ9mE',
    appId: '1:712914661608:web:4a4a20819d471e6658995d',
    messagingSenderId: '712914661608',
    projectId: 'e-gordon',
    authDomain: 'e-gordon.firebaseapp.com',
    storageBucket: 'e-gordon.appspot.com',
    measurementId: 'G-32SZWMB8GY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_jn_iD4CYCRTBigKqSnrHssLMjqccxVw',
    appId: '1:712914661608:android:49d92bd4542eb13658995d',
    messagingSenderId: '712914661608',
    projectId: 'e-gordon',
    storageBucket: 'e-gordon.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAt1Vg51zZEU-ESlUWQkzOIApcLWXPhwhs',
    appId: '1:712914661608:ios:465a1aa8ce14d6c658995d',
    messagingSenderId: '712914661608',
    projectId: 'e-gordon',
    storageBucket: 'e-gordon.appspot.com',
    iosClientId: '712914661608-ah35ppjfmcl7dh10aod4deon8bi307lk.apps.googleusercontent.com',
    iosBundleId: 'com.egordon.ios',
  );
}
