// ignore_for_file: non_constant_identifier_names

import 'package:fish_man/features/tankinfo_screen/data/tank_entries_database.dart';
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
  //DB
  final TankEntriesDatabase _tankDB = TankEntriesDatabase();

  //Controllers
  final TextEditingController _pHController = TextEditingController();
  final TextEditingController _NH3Controller = TextEditingController();
  final TextEditingController _NO2Controller = TextEditingController();
  final TextEditingController _NO3Controller = TextEditingController();
  final TextEditingController _GHController = TextEditingController();
  final TextEditingController _KHController = TextEditingController();
  final TextEditingController _TDSController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //LIST OF CONTROLLERS
    List<TextEditingController> controllers = [
      _GHController,
      _KHController,
      _NH3Controller,
      _NO2Controller,
      _NO3Controller,
      _TDSController,
      _pHController,
      _noteController,
    ];

    final List<Subentry> subEntryList = [
      Subentry(
        shortName: "pH",
        fullName: "pH",
        controller: _pHController,
      ),
      Subentry(
        shortName: "NH3",
        fullName: "Ammonia",
        controller: _NH3Controller,
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
            Map<String, dynamic> data = {"id": widget.tankID};

            if (_pHController.text != "") {
              data["pH"] = double.parse(_pHController.text);
            }

            if (_NH3Controller.text != "") {
              data["NH3"] = double.parse(_NH3Controller.text);
            }

            if (_NO2Controller.text != "") {
              data["NO2"] = double.parse(_NO2Controller.text);
            }

            if (_NO3Controller.text != "") {
              data["NO3"] = double.parse(_NO3Controller.text);
            }

            if (_GHController.text != "") {
              data["GH"] = double.parse(_GHController.text);
            }

            if (_KHController.text != "") {
              data["KH"] = double.parse(_KHController.text);
            }

            if (_TDSController.text != "") {
              data["TDS"] = double.parse(_TDSController.text);
            }

            if (_noteController.text != "") {
              data["note"] = _noteController.text;
            }

            print(data);

            _tankDB.sendTankEntry(data: data);
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
