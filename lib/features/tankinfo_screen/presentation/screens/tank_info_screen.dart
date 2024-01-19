import 'package:fish_man/features/tankinfo_screen/data/tank_entries_database.dart';
import 'package:fish_man/features/tankinfo_screen/presentation/screens/new_entry_screen.dart';
import 'package:fish_man/features/tankinfo_screen/presentation/widgets/entry.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TankInfoScreen extends StatelessWidget {
  final int tankID;
  final String tankName;
  const TankInfoScreen(
      {super.key, required this.tankID, required this.tankName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewEntryScreen(
                        tankID: tankID,
                        tankName: tankName,
                      )));
        },
        child: const Icon(Icons.add_rounded),
      ),

      //appBar
      appBar: AppBar(
        title: Text(tankName),
        actions: [
          //delete tank button
          //TODO: Change this to a burger menu
          InkWell(
            onTap: () {
              TankEntriesDatabase().deleteTank(tankID);
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete_forever),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: const [],
        ),
      ),
    );
  }
}
