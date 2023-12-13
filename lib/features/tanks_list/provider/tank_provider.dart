import '../data/tanklist_database.dart';
import 'package:flutter/cupertino.dart';
import '../models/tank.dart';

class TankProvider extends ChangeNotifier {
//List of tanks
  final List<Tank> _listOfTanks = [];
  TankProvider() {
    getListOfTanks();
  }

//getter for list of tanks currently added
  List<Tank> get listOfTanks => _listOfTanks;

//get tanks list

  getListOfTanks() async {
    var data = await TanklistDatabase().getListOfTanks();

    for (var tank in data) {
      _listOfTanks.add(Tank(
          id: tank["id"],
          tankName: tank["tank_name"],
          tankSize: tank["tank_size"],
          occupants: tank["occupants"]));
    }
    notifyListeners();
  }

//adds a tank to the list
  addTank({
    required tankName,
    required tankSize,
  }) {
    try {
      TanklistDatabase()
          .addTankToDatabase(tankName: tankName, tankSize: tankSize);
    } catch (error) {
      return (error);
    }
    getListOfTanks();
  }
}
