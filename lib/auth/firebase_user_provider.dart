import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class RepassionNeugemachtFirebaseUser {
  RepassionNeugemachtFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

RepassionNeugemachtFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<RepassionNeugemachtFirebaseUser>
    repassionNeugemachtFirebaseUserStream() => FirebaseAuth.instance
            .authStateChanges()
            .debounce((user) => user == null && !loggedIn
                ? TimerStream(true, const Duration(seconds: 1))
                : Stream.value(user))
            .map<RepassionNeugemachtFirebaseUser>(
          (user) {
            currentUser = RepassionNeugemachtFirebaseUser(user);
            return currentUser!;
          },
        );
