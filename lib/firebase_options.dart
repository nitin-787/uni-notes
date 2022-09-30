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
    apiKey: 'AIzaSyCLPVrFTkfIUSyXrSoj_gZ8D2HUV6RO-Rw',
    appId: '1:563289848653:web:4d8693d653b7212f691504',
    messagingSenderId: '563289848653',
    projectId: 'mynotes-2022-ef9ec',
    authDomain: 'mynotes-2022-ef9ec.firebaseapp.com',
    storageBucket: 'mynotes-2022-ef9ec.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJwFbmpt8S5lsW7ilw-fU21BAtORibV6g',
    appId: '1:563289848653:android:c4c6669dc689dd54691504',
    messagingSenderId: '563289848653',
    projectId: 'mynotes-2022-ef9ec',
    storageBucket: 'mynotes-2022-ef9ec.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBicOW4e5YpwQkBNnv2x8Hg7iL68PArAbc',
    appId: '1:563289848653:ios:8175b0b75bc33d95691504',
    messagingSenderId: '563289848653',
    projectId: 'mynotes-2022-ef9ec',
    storageBucket: 'mynotes-2022-ef9ec.appspot.com',
    iosClientId: '563289848653-fhb3gh3us218niov6anl4cko4r7gkbsm.apps.googleusercontent.com',
    iosBundleId: 'com.nitin.mynotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBicOW4e5YpwQkBNnv2x8Hg7iL68PArAbc',
    appId: '1:563289848653:ios:8175b0b75bc33d95691504',
    messagingSenderId: '563289848653',
    projectId: 'mynotes-2022-ef9ec',
    storageBucket: 'mynotes-2022-ef9ec.appspot.com',
    iosClientId: '563289848653-fhb3gh3us218niov6anl4cko4r7gkbsm.apps.googleusercontent.com',
    iosBundleId: 'com.nitin.mynotes',
  );
}
