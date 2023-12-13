// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AddTankTextBox extends StatelessWidget {
  AddTankTextBox({
    super.key,
    required this.hint,
    required this.controller,
    this.icon,
  });

  final String hint;
  final TextEditingController controller;
  IconData? icon;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: icon != null ? Icon(icon) : null,
          hintText: hint,
        ),
      ),
    );
  }
}
