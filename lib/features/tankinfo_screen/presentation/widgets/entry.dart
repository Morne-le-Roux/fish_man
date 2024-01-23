import 'package:fish_man/features/tankinfo_screen/models/tank_entry.dart';
import 'package:flutter/material.dart';

class Entry extends StatelessWidget {
  final Map data;

  const Entry({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(width: 1, color: Colors.black))),
      child: Column(
        children: [
          Text("Entry created at ${data["created_at"]}"),
          Visibility(
            visible: data["note"] != null,
            child: Text("Note: ${data["note"]}"),
          ),
          Visibility(
            visible: data["NH3"] != null,
            child: Text("Ammonia: ${data["NH3"]} ppm"),
          ),
          Visibility(
            visible: data["NO2"] != null,
            child: Text("Nitrite: ${data["NO2"]} ppm"),
          ),
          Visibility(
            visible: data["NO3"] != null,
            child: Text("Nitrate: ${data["NO3"]} ppm"),
          ),
          Visibility(
            visible: data["pH"] != null,
            child: Text("PH: ${data["pH"]} pH"),
          ),
          Visibility(
            visible: data["GH"] != null,
            child: Text("GH: ${data["GH"]}°"),
          ),
          Visibility(
            visible: data["KH"] != null,
            child: Text("KH: ${data["KH"]}°"),
          ),
          Visibility(
            visible: data["TDS"] != null,
            child: Text("TDS:: ${data["TDS"]} ppm"),
          ),
        ],
      ),
    );
  }
}
