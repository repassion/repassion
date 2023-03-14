import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class RepassionFirebaseUser {
  RepassionFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

RepassionFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<RepassionFirebaseUser> repassionFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<RepassionFirebaseUser>(
      (user) {
        currentUser = RepassionFirebaseUser(user);
        return currentUser!;
      },
    );
