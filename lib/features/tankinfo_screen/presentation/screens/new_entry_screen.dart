import 'package:fish_man/features/tankinfo_screen/presentation/widgets/note_entry.dart';
import 'package:fish_man/features/tankinfo_screen/presentation/widgets/subentry.dart';
import 'package:flutter/material.dart';

class NewEntryScreen extends StatefulWidget {
  const NewEntryScreen(
      {super.key, required this.tankID, required this.tankName});

  final int tankID;
  final String tankName;

  @override
  State<NewEntryScreen> createState() => _NewEntryScreenState();
}

class _NewEntryScreenState extends State<NewEntryScreen> {
  final List<Subentry> _subEntryList = [
    Subentry(shortName: "pH", fullName: "pH"),
    Subentry(shortName: "NH4", fullName: "Ammonia"),
    Subentry(shortName: "NO2", fullName: "Nitrites"),
    Subentry(shortName: "NO3", fullName: "Nitrates"),
    Subentry(shortName: "GH", fullName: "General Hardness"),
    Subentry(shortName: "KH", fullName: "Carbonate Hardness"),
    Subentry(shortName: "TDS", fullName: "Total Dissolved Solids"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //on finish
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.check),
          onPressed: () {
            Map data = {};

            //TODO: Fix this. Everything returns null.
            for (var entry in _subEntryList) {
              if (entry.value != "") {
                data.addAll({entry.shortName: entry.value});
              }
            }
            print(data);
          }),
      appBar: AppBar(
        //TODO: Add tank name to appBar.
        title: Text("New Entry for ${widget.tankName}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //subentries
            ListView(
              shrinkWrap: true,
              children: [
                ..._subEntryList,
                NoteEntry(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
