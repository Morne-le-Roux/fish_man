import 'package:flutter/material.dart';

class NoteEntry extends StatelessWidget {
  const NoteEntry({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(3),
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Note",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: controller,
              maxLines: 10,
              decoration: const InputDecoration(border: InputBorder.none),
              scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
            )
          ],
        ),
      ),
    );
  }
}
