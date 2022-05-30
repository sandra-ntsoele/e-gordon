import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Listen to auth state changes
  Stream<User?> get userStateStream => _auth.authStateChanges();

  Stream<User?> get userChanges => _auth.userChanges();

  User? get user => _auth.currentUser;

  AuthService();

  Future<String> createAccount(
    String firstName,
    String email,
    String password,
  ) async {
    try {
      // Create user
      await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((userCredential) {
        User? user = userCredential.user;

        // Then verify their email
        if (user != null) {
          user.updateDisplayName(firstName);
          user.sendEmailVerification();
        }
      });

      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      rethrow;
    }
  }

  bool get emailIsVerified {
    user!.reload();

    if (user!.emailVerified) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> signInWithEmail(String email, String password) async {
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

  Future<dynamic> signInWithGoogle() async {
    // Trigger auth flow
    final GoogleSignInAccount? user = await GoogleSignIn().signIn();

    // Get auth details
    final GoogleSignInAuthentication? googleAuth = await user?.authentication;

    // Create a credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth!.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
      // Sign in and return the UserCredential
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        return e.message;
      } else if (e.code == 'invalid-credential') {
        return e.message;
      }
    } catch (e) {
      return e;
    }
  }
}
