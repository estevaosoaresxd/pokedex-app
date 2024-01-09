import "package:firebase_auth/firebase_auth.dart";
import "package:google_sign_in/google_sign_in.dart";

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    if (googleAuth != null) {
      // Create a new credential

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return _firebaseAuth.signInWithCredential(credential);
    }

    return null;
  }

  Future<UserCredential> signInWithApple() async {
    final appleProvider = AppleAuthProvider();

    return _firebaseAuth.signInWithProvider(appleProvider);
  }

  Future<UserCredential?> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        // print("The password provided is too weak.");
      } else if (e.code == "email-already-in-use") {
        // print("The account already exists for that email.");
      }
    } catch (e) {
      // print(e);
    }

    return null;
  }

  Future<UserCredential?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print("The password provided is too weak.");
      } else if (e.code == "email-already-in-use") {
        print("The account already exists for that email.");
      } else if (e.code == "invalid-email") {
        print("email invalido");
      }
    } catch (e) {
      // print(e);
    }

    return null;
  }

  Future<UserCredential?> forgotPasswordEmail({
    required String email,
  }) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print("The password provided is too weak.");
      } else if (e.code == "email-already-in-use") {
        print("The account already exists for that email.");
      } else if (e.code == "invalid-email") {
        print("email invalido");
      }
    } catch (e) {
      // print(e);
    }

    return null;
  }

  Future<void> signOutUser() async {
    final User? firebaseUser = _firebaseAuth.currentUser;

    if (firebaseUser != null) {
      await _firebaseAuth.signOut();
    }
  }
}
