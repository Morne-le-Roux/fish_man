// ignore_for_file: use_build_context_synchronously

import 'package:fish_man/features/auth/presentation/screens/register_screen.dart';
import 'package:fish_man/features/tanks_list/presentation/screens/tanks_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:fish_man/features/auth/data/supabase_auth_m.dart';
import '../widgets/auth_text_box.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final SupabaseAuthM _supabaseAuthM = SupabaseAuthM();

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

          const SizedBox(height: 40),

          //BUTTON

          InkWell(
            onTap: () async {
              try {
                //signs in user
                var response = await _supabaseAuthM.singIn(
                    email: _emailController.text,
                    password: _passwordController.text);
                if (response.user != null) {
                  //if user is successfully signed in, pushes user to tank list screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TanksListScreen()));
                }
              } catch (e) {
                //catch and display any errors
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(e.toString())));
              }
            },
            //button look
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
              child: const Text("Login"),
            ),
          ),

          //spacing
          const SizedBox(height: 40),

          //button to take user to registration screen instead
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()));
            },
            child: const Text("Register Instead",
                style: TextStyle(fontStyle: FontStyle.italic)),
          ),
        ],
      )),
    );
  }
}
