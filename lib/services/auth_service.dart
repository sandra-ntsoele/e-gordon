import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  // Listen to auth state changes
  Stream<User?> get userStateStream => _auth.authStateChanges();

  Stream<User?> get userChanges => _auth.userChanges();

  String? validateEmail(String? input) {
    if (input == null || input.isEmpty) {
      return "Email is required";
    } else if (!EmailValidator.validate(input)) {
      return "Invalid email";
    }
    return null;
  }

  // Creating a user with email and password
  Future<String> createAccount(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> signOut() async {
    try {
      await _auth.signOut();

      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      rethrow;
    }
  }
}
