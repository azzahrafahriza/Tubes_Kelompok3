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
    apiKey: 'AIzaSyBcMhWExe-hFHH5SOdPT1f2tzFZfKky3W4',
    appId: '1:323168376500:web:ac0af569853cb4dc3729e1',
    messagingSenderId: '323168376500',
    projectId: 'authtubes-ad1ba',
    authDomain: 'authtubes-ad1ba.firebaseapp.com',
    storageBucket: 'authtubes-ad1ba.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBFeUk5ub9g9Tj13FAaHhxmKueLhg7iMqw',
    appId: '1:323168376500:android:e9aae8ceaaf133fe3729e1',
    messagingSenderId: '323168376500',
    projectId: 'authtubes-ad1ba',
    storageBucket: 'authtubes-ad1ba.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZgW6Dqdv5UNYu3TUV68FwjZCGyJ9KmCQ',
    appId: '1:323168376500:ios:4520104af6090dfe3729e1',
    messagingSenderId: '323168376500',
    projectId: 'authtubes-ad1ba',
    storageBucket: 'authtubes-ad1ba.appspot.com',
    iosClientId: '323168376500-dqogoimdhrutqsot6s40v0qf30m6ahq5.apps.googleusercontent.com',
    iosBundleId: 'com.example.tubes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZgW6Dqdv5UNYu3TUV68FwjZCGyJ9KmCQ',
    appId: '1:323168376500:ios:4520104af6090dfe3729e1',
    messagingSenderId: '323168376500',
    projectId: 'authtubes-ad1ba',
    storageBucket: 'authtubes-ad1ba.appspot.com',
    iosClientId: '323168376500-dqogoimdhrutqsot6s40v0qf30m6ahq5.apps.googleusercontent.com',
    iosBundleId: 'com.example.tubes',
  );
}
