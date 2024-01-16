import 'package:flutter/material.dart';

class NoteEntry extends StatelessWidget {
  NoteEntry({super.key});

  final TextEditingController _controller = TextEditingController();

  String get value => _controller.text;

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
              controller: _controller,
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
