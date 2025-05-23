import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  // get instance of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // get current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
  // // Get the current user's ID (uid)
  // String? getCurrentUserId() {
  //   final User? user = _firebaseAuth.currentUser;
  //   return user?.uid; // Returns null if no user is signed in
  // }

  // login
  Future<UserCredential> logInWithEmailPassword(String email, password) async {
    // try sign user in
    try{
      UserCredential userCredential =
        await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
      );

      return userCredential;
    }
    // catch any errors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign in/up
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    // try sign user in
    try{
      UserCredential userCredential =
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    }
    // catch any errors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // logout/sign out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}