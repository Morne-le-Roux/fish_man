import 'package:flutter/material.dart';

class Subentry extends StatelessWidget {
  const Subentry({super.key, required this.shortName, required this.fullName});

  final String shortName;
  final String fullName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(shortName),
            subtitle: Text("The amount of $fullName in your tank."),
          ),
        ],
      ),
    );
  }
}
