import 'package:firebase_auth/firebase_auth.dart';

class AuthUtils {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Login function
  Future<User?> loginUser(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // Handle errors by code
      switch (e.code) {
        case 'user-not-found':
          throw 'No user found for that email.';
        case 'wrong-password':
          throw 'Wrong password provided.';
        default:
          throw 'An error occurred. Please try again.';
      }
    }
  }

  // Logout function
  Future<void> logoutUser() async {
    await _auth.signOut();
  }
}
