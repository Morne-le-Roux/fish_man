import 'package:flutter/material.dart';

class AuthTextBox extends StatelessWidget {
  const AuthTextBox({
    super.key,
    required this.hint,
    required this.controller,
    required this.icon,
  });

  final String hint;
  final TextEditingController controller;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      decoration: const BoxDecoration(),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(icon),
          hintText: hint,
        ),
      ),
    );
  }
}
