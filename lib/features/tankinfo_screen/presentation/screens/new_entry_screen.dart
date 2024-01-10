import 'package:flutter/material.dart';

class NewEntryScreen extends StatelessWidget {
  const NewEntryScreen({super.key});

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
