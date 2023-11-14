import 'package:flutter/cupertino.dart';
import '../models/tank.dart';

class TankProvider extends ChangeNotifier {
  final List<Tank> _tanks = [];

//getter for list of tanks currently added
  List<Tank> get tanks => _tanks;

//adds a tank to the list
  addTank(
      {required id, required tankName, required tankSize, required occupants}) {
    _tanks.add(Tank(
        id: id, tankName: tankName, tankSize: tankSize, occupants: occupants));
    notifyListeners();
  }
}
