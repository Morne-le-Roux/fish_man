import 'package:flutter/material.dart';

class NewEntry extends StatelessWidget {
  const NewEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TODO: Add tank name to appBar.
        title: const Text("New Entry for 'Tank Name'"),
      ),
    );
  }
}
