import 'package:flutter/material.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({super.key});

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool? remember;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      margin: const EdgeInsets.only(
          right:
              20), //checkbox makes it look off center... this just fixes that.
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
              value: remember ?? false,
              onChanged: (value) {
                setState(() {
                  remember = value;
                });
              }),
          const Text("Remember Me"),
        ],
      ),
    );
  }
}
