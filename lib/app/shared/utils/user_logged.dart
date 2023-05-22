import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserLogged {
  factory UserLogged() {
    return _instance;
  }

  UserLogged._internal();
  static final UserLogged _instance = UserLogged._internal();
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  Future<void> login() async {
    final email = dotenv.env['LOGIN'] as String;
    final password = dotenv.env['PASSWORD'] as String;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _isLoggedIn = true;
    } on Exception catch (_) {
      _isLoggedIn = false;
    }
  }

  void logout() {
    _isLoggedIn = false;
  }
}
