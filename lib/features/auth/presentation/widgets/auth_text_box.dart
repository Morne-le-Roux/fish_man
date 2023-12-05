import 'package:flutter/material.dart';

class AuthTextBox extends StatelessWidget {
  const AuthTextBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.email),
          hintText: "Email",
        ),
      ),
    );
  }
}
