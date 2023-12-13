import 'package:fish_man/features/auth/data/supabase_auth_m.dart';
import 'package:fish_man/features/auth/presentation/screens/login_screen.dart';
import 'package:fish_man/features/auth/presentation/widgets/auth_text_box.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();
  final SupabaseAuthM _supabaseAuthM = SupabaseAuthM();

  bool passwordsCheck() {
    if (_passwordController.text == "" || _password2Controller.text == "") {
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
            obscureText: true,
          ),
          AuthTextBox(
            hint: "Confirm Password",
            controller: _password2Controller,
            icon: Icons.check_circle,
            obscureText: true,
          ),
          const SizedBox(height: 40),

          //BUTTON

          InkWell(
            onTap: () async {
              if (passwordsCheck()) {
                try {
                  AuthResponse response = await _supabaseAuthM.register(
                      email: _emailController.text,
                      password: _passwordController.text);

                  if (response.user != null) {
                    // ignore: use_build_context_synchronously
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }
                } catch (e) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                        "Something went wrong! Please check that you passwords match.")));
              }
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

          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: const Text("Login Instead",
                style: TextStyle(fontStyle: FontStyle.italic)),
          ),
        ],
      )),
    );
  }
}
