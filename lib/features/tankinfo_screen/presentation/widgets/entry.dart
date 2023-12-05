import 'package:fish_man/features/tankinfo_screen/models/tank_entry.dart';
import 'package:flutter/material.dart';

class Entry extends StatelessWidget {
  final TankEntry _tankEntry;

  const Entry({super.key, required tankEntry}) : _tankEntry = tankEntry;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(width: 1, color: Colors.black))),
      child: Column(
        children: [
          Text("Entry created at ${_tankEntry.data["created_at"]}"),
          Text("Note: ${_tankEntry.data["note"]}"),
          Text("Ammonia: ${_tankEntry.data["ammonia"]} ppm"),
          Text("Nitrite: ${_tankEntry.data["nitrite"]} ppm"),
          Text("Nitrate: ${_tankEntry.data["nitrate"]} ppm"),
          Text("PH: ${_tankEntry.data["ph"]} ph"),
          Text("GH: ${_tankEntry.data["gh"]}°"),
          Text("KH: ${_tankEntry.data["kh"]}°"),
          Text("TDS:: ${_tankEntry.data["tds"]} ppm"),
        ],
      ),
    );
  }
}
