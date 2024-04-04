
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:olxfirebase/view/authentication/login_page.dart';
import 'package:olxfirebase/view/bottom_screen.dart';
import 'package:olxfirebase/view/home.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return  HomeScreen();
          } else {
            //user not logged in
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
