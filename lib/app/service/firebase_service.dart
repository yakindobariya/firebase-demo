import 'package:flutter/material.dart';

import '../constant/export.dart';

class FirebaseService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<bool?> registerWithEmailOrPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      final res = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (res.user != null) {
        await res.user!.sendEmailVerification();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Registration successful! Verification email sent."),
          backgroundColor: Colors.green,
        ));
        return true;
      }
      return false;
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = "This email is already in use.";
          break;
        case 'invalid-email':
          errorMessage = "The email address is not valid.";
          break;
        case 'weak-password':
          errorMessage = "The password is too weak.";
          break;
        default:
          errorMessage = "An error occurred. Please try again.";
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.red,
      ));
      return null;
    } catch (e) {
      print("Unexpected error during registration: $e");
      return null;
    }
  }

  Future<void> checkEmailVerification(BuildContext context,void Function(bool) updateIsChecked) async {
    User? user = firebaseAuth.currentUser;
    if (user != null) {
      await user.reload(); // Ensure we get the latest user state
      user = firebaseAuth.currentUser;

      if (user!.emailVerified) {
        updateIsChecked(true);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage(),));
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Your email is verified."),
          backgroundColor: Colors.green,
        ));
      } else {
        updateIsChecked(false);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Your email is not verified. Please verify to continue."),
          backgroundColor: Colors.orange,
        ));
      }
    } else {
      updateIsChecked(false);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No user is currently logged in."),
        backgroundColor: Colors.red,
      ));
    }
  }

}
