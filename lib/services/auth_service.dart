import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  // Listen to auth state changes
  get authState => _auth.authStateChanges();
  get userChanges => _auth.authStateChanges();
}
