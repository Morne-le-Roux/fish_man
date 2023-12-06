import 'package:fish_man/features/auth/presentation/widgets/auth_text_box.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AuthTextBox(
            hint: "Email",
            controller: emailController,
            icon: Icons.email,
          ),
          AuthTextBox(
            hint: "Password",
            controller: passwordController,
            icon: Icons.password,
          ),
          AuthTextBox(
            hint: "Confirm Password",
            controller: password2Controller,
            icon: Icons.check_circle,
          )
        ],
      )),
    );
  }
}
