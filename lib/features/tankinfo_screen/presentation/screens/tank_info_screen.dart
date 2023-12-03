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
          return ListView.builder(itemBuilder: (context, index) {
            return Entry(tankEntry: tankEntriesProvider.listOfEntries[index]);
          });
        }));
  }
}
