import 'package:flutter/material.dart';

class Subentry extends StatelessWidget {
  const Subentry({super.key, required this.shortName, required this.fullName});

  final String shortName;
  final String fullName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.white), //TODO: Should change to black in light mode
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            shortName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text("The amount of $fullName in your tank."),
        ],
      ),
    );
  }
}
