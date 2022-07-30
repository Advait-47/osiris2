import 'package:ihosiris/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ihosiris/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser

  UserDetails? _userFromFirebaseUser(User user) {
    return user != null
        ? UserDetails(
            uid: user.uid,
          )
        : null;
  }

  //auth change user stream
  Stream<UserDetails?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!));
  }

  //sign in anonymoosly
  Future signInAnon() async {
    try {
      UserCredential result = await FirebaseAuth.instance.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
      print("Signed in with temporary account.");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
    // try {
    //   AuthResult result = await _auth.signInAnonymously();
    //   FirebaseUser user = result.user;
    // } catch (e) {
    //   print(e.toString());
    //   return null;
    // }
  }

  //sign in email password
  Future signInWithEmailAndPassword(
      UserDetails existingUser, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: existingUser.email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  //register with email pass

  Future registerWithEmailAndPassword(
      UserDetails newUser, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: newUser.email,
        password: password,
      );

      User? user = result.user;
      await DatabaseService(uid: user!.uid).updateUserData(newUser, user.uid);
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }
  //signout

  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
