import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ThePlantAppFirebaseUser {
  ThePlantAppFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

ThePlantAppFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ThePlantAppFirebaseUser> thePlantAppFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ThePlantAppFirebaseUser>(
      (user) {
        currentUser = ThePlantAppFirebaseUser(user);
        return currentUser!;
      },
    );
