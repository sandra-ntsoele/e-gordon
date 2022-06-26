import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  /* FIELDS */
  FirebaseAuth auth = FirebaseAuth.instance;

  /* PROPERTIES*/
  Stream<User?> get userStateStream => auth.authStateChanges();
  Stream<User?> get userChanges => auth.userChanges();
  User? get currentUser => auth.currentUser;
  FirebaseAuth get firebase => auth;

  /* METHODS */
  Future<String> createAccount(
    String firstName,
    String email,
    String password,
  ) async {
    try {
      // Create user
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        (userCredential) async {
          User? user = userCredential.user;

          if (user != null) {
            user.updateDisplayName(firstName);
            user.sendEmailVerification();
          }
        },
      );

      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> signInWithEmail(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
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
      await auth.signOut();

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
      return await auth.signInWithCredential(credential);
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

  Future<String> sendPasswordResetEmail(String email) async {
    try {
      await auth.sendPasswordResetEmail(
        email: email,
        // actionCodeSettings: ActionCodeSettings(url: url),
      );

      return "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        return "That email does not exist";
      } else {
        return e.message.toString();
      }
    } catch (e) {
      rethrow;
    }
  }
}
