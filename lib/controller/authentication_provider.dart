import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:olxfirebase/service/auth_service.dart';

class AuthenticationProvider extends ChangeNotifier{

 final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authenticationService = AuthService();
  bool isAdminHome = false;

  void signInWithEmailAndPassword(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await _authenticationService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);

      if (context.mounted) Navigator.pop(context);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessage(e.code, context);
      notifyListeners();
    }
  }
     void signOut()async {
   await FirebaseAuth.instance.signOut();
    notifyListeners();
  }

 Future<void> googleSignOut()async{
   await GoogleSignIn().signOut();
    notifyListeners();
  }
 
Future<void> signInWithGoogle(context) async {
    try {
      await _authenticationService.signInWithGoogle();
      notifyListeners();
    } catch (e) {
      displayMessage(e.toString(), context);
      notifyListeners();
    }
  }
  void displayMessage(String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

}