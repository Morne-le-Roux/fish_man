// ignore_for_file: non_constant_identifier_names

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
  //Controllers
  final TextEditingController _pHController = TextEditingController();
  final TextEditingController _NH4Controller = TextEditingController();
  final TextEditingController _NO2Controller = TextEditingController();
  final TextEditingController _NO3Controller = TextEditingController();
  final TextEditingController _GHController = TextEditingController();
  final TextEditingController _KHController = TextEditingController();
  final TextEditingController _TDSController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<Subentry> subEntryList = [
      Subentry(
        shortName: "pH",
        fullName: "pH",
        controller: _pHController,
      ),
      Subentry(
        shortName: "NH4",
        fullName: "Ammonia",
        controller: _NH4Controller,
      ),
      Subentry(
        shortName: "NO2",
        fullName: "Nitrites",
        controller: _NO2Controller,
      ),
      Subentry(
        shortName: "NO3",
        fullName: "Nitrates",
        controller: _NO3Controller,
      ),
      Subentry(
        shortName: "GH",
        fullName: "General Hardness",
        controller: _GHController,
      ),
      Subentry(
        shortName: "KH",
        fullName: "Carbonate Hardness",
        controller: _KHController,
      ),
      Subentry(
        shortName: "TDS",
        fullName: "Total Dissolved Solids",
        controller: _TDSController,
      ),
    ];
    return Scaffold(
      //on finish
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.check),
          onPressed: () {
            Map data = {};

            print(data);
          }),
      appBar: AppBar(
        title: Text("New Entry for ${widget.tankName}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //subentries
            ListView(
              shrinkWrap: true,
              children: [
                ...subEntryList,
                NoteEntry(
                  controller: _noteController,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
