import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AcuarioFirebaseUser {
  AcuarioFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

AcuarioFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<AcuarioFirebaseUser> acuarioFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<AcuarioFirebaseUser>(
      (user) {
        currentUser = AcuarioFirebaseUser(user);
        return currentUser!;
      },
    );
