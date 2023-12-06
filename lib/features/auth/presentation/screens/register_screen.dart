import 'package:fish_man/features/auth/data/supabase_auth_m.dart';
import 'package:fish_man/features/auth/presentation/widgets/auth_text_box.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();
  final SupabaseAuthM _supabaseAuthM = SupabaseAuthM();

  bool passwordsCheck() {
    if (_passwordController == "" || _password2Controller.text == "") {
      return false;
    }
    if (_password2Controller.text == _passwordController.text) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AuthTextBox(
            hint: "Email",
            controller: _emailController,
            icon: Icons.email,
          ),
          AuthTextBox(
            hint: "Password",
            controller: _passwordController,
            icon: Icons.password,
          ),
          AuthTextBox(
            hint: "Confirm Password",
            controller: _password2Controller,
            icon: Icons.check_circle,
          ),
          const SizedBox(height: 40),

          //BUTTON

          InkWell(
            onTap: () {
              if (passwordsCheck()) {
                try {
                  _supabaseAuthM.register(
                      email: _emailController.text,
                      password: _passwordController.text);
                } catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                }
              } else {}
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
              child: const Text("Register"),
            ),
          ),
          const SizedBox(height: 40),

          //TODO: Implement "Login Instead" button.
          const InkWell(
            child: Text("Login Instead",
                style: TextStyle(fontStyle: FontStyle.italic)),
          ),
        ],
      )),
    );
  }
}
