import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  // CREATING EMAIL
  static Future<String> createaccountwithemail(
    String email,
    String password,
  ) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "account created";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      return "Something went Wrong $e";
    }
  }

  // LOGIN AUTH
  static Future<String> loginwithusernameandpassword(
    String email,
    String password,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "Login successful";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      return "something went wrong $e";
    }
  }

  // LOGOUT
  static Future logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  // USER LOGGED IN
  static Future<bool> userloggedin() async {
    var currentuser = await FirebaseAuth.instance.currentUser;
    return currentuser!=null  ? true : false;
  }
}
