import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDZDnTHgoxTK0n5SRnlIqOtVGgsdDq_jaM",
            authDomain: "repassion-9ce5f.firebaseapp.com",
            projectId: "repassion-9ce5f",
            storageBucket: "repassion-9ce5f.appspot.com",
            messagingSenderId: "218152947915",
            appId: "1:218152947915:web:3a2c877816b1f79560cb4e",
            measurementId: "G-P07T8N2ZQZ"));
  } else {
    await Firebase.initializeApp();
  }
}
