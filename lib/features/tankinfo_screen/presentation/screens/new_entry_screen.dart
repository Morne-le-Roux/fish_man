import 'package:fish_man/features/tankinfo_screen/presentation/widgets/note_entry.dart';
import 'package:fish_man/features/tankinfo_screen/presentation/widgets/subentry.dart';
import 'package:fish_man/features/tankinfo_screen/provider/sub_entries_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewEntryScreen extends StatefulWidget {
  const NewEntryScreen({super.key});

  @override
  State<NewEntryScreen> createState() => _NewEntryScreenState();
}

class _NewEntryScreenState extends State<NewEntryScreen> {
  final List<Widget> _availableSubEntries = [
    const Subentry(shortName: "pH", fullName: "pH"),
    const Subentry(shortName: "Ammonia", fullName: "Ammonia"),
    const Subentry(shortName: "Nitrite", fullName: "Nitrite"),
    const Subentry(shortName: "Nitrates", fullName: "Nitrates"),
    const Subentry(shortName: "TDS", fullName: "Total Dissolved Solids"),
    const Subentry(shortName: "GH", fullName: "General Hardness"),
    const Subentry(shortName: "KH", fullName: "Carbonate Hardness"),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<SubEntriesProvider>(
      builder: (context, subEntriesProvider, child) => Scaffold(
        appBar: AppBar(
          //TODO: Add tank name to appBar.
          title: const Text("New Entry for 'Tank Name'"),
        ),
        body: Column(
          children: [
            //subentries
            ListView(
              shrinkWrap: true,
              children: subEntriesProvider.listOfSubEntries,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //BOTTOM SHEET
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: List.generate(
                        _availableSubEntries.length,
                        (index) => GestureDetector(
                          child: _availableSubEntries[index],
                          onTap: () {
                            subEntriesProvider.addSubEntry(_availableSubEntries[
                                index]); //TODO: Does not rebuild list.
                            Navigator.pop(
                              context,
                            );
                          },
                        ),
                      ),
                    ),
                  );
                });
          },
          child: const Icon(Icons.add_chart),
        ),
      ),
    );
  }
}
