import 'package:fish_man/features/tankinfo_screen/models/tank_entry.dart';
import 'package:flutter/material.dart';

class Entry extends StatelessWidget {
  final TankEntry _tankEntry;

  const Entry({super.key, required tankEntry}) : _tankEntry = tankEntry;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [],
      ),
    );
  }
}
