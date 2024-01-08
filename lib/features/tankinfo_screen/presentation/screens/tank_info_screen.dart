import 'package:fish_man/features/tankinfo_screen/data/tank_entries_database.dart';
import 'package:fish_man/features/tankinfo_screen/presentation/screens/new_entry.dart';
import 'package:fish_man/features/tankinfo_screen/presentation/widgets/entry.dart';
import 'package:fish_man/features/tankinfo_screen/provider/tank_entries_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TankInfoScreen extends StatelessWidget {
  final int tankID;
  final String tankName;
  const TankInfoScreen(
      {super.key, required this.tankID, required this.tankName});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TankEntriesProvider>(
      create: (context) => TankEntriesProvider(tankID: tankID),
      child: Consumer<TankEntriesProvider>(
          builder: (context, tankEntriesProvider, child) {
        return Scaffold(
          //Floating Action Button
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NewEntry()));
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
