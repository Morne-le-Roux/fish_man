import 'package:fish_man/features/tankinfo_screen/data/tank_entries_database.dart';
import 'package:fish_man/features/tankinfo_screen/presentation/widgets/entry.dart';
import 'package:fish_man/features/tankinfo_screen/provider/tank_entries_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TankInfoScreen extends StatelessWidget {
  final int tankID;
  const TankInfoScreen({super.key, required this.tankID});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TankEntriesProvider>(
      create: (context) => TankEntriesProvider(tankID: tankID),
      child: Consumer<TankEntriesProvider>(
          builder: (context, tankEntriesProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Tank Name"),
            actions: [
              //delete tank button
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
              children: List.generate(
                tankEntriesProvider.listOfEntries.length,
                (index) => Entry(
                  tankEntry: tankEntriesProvider.listOfEntries[index],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
