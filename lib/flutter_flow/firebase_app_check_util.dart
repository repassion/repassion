import 'package:firebase_app_check/firebase_app_check.dart';

Future initializeFirebaseAppCheck() => FirebaseAppCheck.instance.activate(
      webRecaptchaSiteKey: '6Ld-CQAlAAAAAFv7k7AEKOP6qk487rciAVRpR1qm',
      androidProvider: AndroidProvider.playIntegrity,
    );
