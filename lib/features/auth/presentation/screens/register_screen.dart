import 'package:fish_man/features/auth/presentation/widgets/auth_text_box.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [AuthTextBox()],
      )),
    );
  }
}
