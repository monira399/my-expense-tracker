import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
  }

  Future<UserCredential> login({
    required String email,
    required String password,
}) async {
    return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password
    );

  }

  Future<void> logOut() async {
    await _auth.signOut();
  }

  User? getCurrentUser() {
    return _auth.currentUser;}

  Future<void> resetPassword(String email) {
    return _auth.sendPasswordResetEmail(email: email,
    );
  }
}