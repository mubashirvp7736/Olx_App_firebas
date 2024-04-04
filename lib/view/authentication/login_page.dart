
import 'package:flutter/material.dart';
import 'package:olxfirebase/controller/authentication_provider.dart';
import 'package:olxfirebase/view/authentication/phone_auth.dart';
import 'package:olxfirebase/view/authentication/register_page.dart';
import 'package:olxfirebase/view/widgets/button_widget.dart';
import 'package:olxfirebase/view/widgets/square_button.dart';
import 'package:olxfirebase/view/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final Function()? onTap;
  const LoginScreen({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Consumer<AuthenticationProvider>(
              builder: (context, value, child) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    'Welcome back to the login screen',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    controller: value.emailController,
                    hintText: 'Enter the email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                      controller: value.passwordController,
                      hintText: 'Enter the password here',
                      obscureText: true),
                  const SizedBox(height: 20),
                  MyButton(
                    text: 'Sign In',
                    onTap: () => value.signInWithEmailAndPassword(context),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have account? ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      InkWell(
                        onTap: () {
                          onTap;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const RegisterScreen()));
                        },
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      const Text(
                        "Or connect with",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Consumer<AuthenticationProvider>(
                    builder: (context, value, child) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SquareButton(
                          imagePath: 'assets/google.json',
                          onTap: () => value.signInWithGoogle(context),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        // SquareButton(
                        //     imagePath: 'assets/github.json',
                        //     onTap: value.signInWithGithub
                        //     ),
                        const SizedBox(
                          width: 5,
                        ),
                        SquareButton(
                            imagePath: 'assets/phone.json',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  PhoneAuth()));
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}