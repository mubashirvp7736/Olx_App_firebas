// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:olxfirebase/controller/register_provider.dart';
import 'package:olxfirebase/view/widgets/button_widget.dart';
import 'package:olxfirebase/view/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  final Function()? onTap;
  const RegisterScreen({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Consumer<RegisterProvider>(
              builder: (context, value, child) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      // child: Lottie.asset('assets/reg.json'),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Create an account',
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
                  MyTextField(
                      controller: value.confirmPassController,
                      hintText: 'Enter the confirm password here',
                      obscureText: true),
                  const SizedBox(height: 20),
                  MyButton(
                    text: 'Sign Up',
                    onTap: () => value.signUp(context),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'already have an account? ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      InkWell(
                        onTap: () {
                          onTap;
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
