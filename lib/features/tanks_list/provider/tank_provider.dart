import 'package:fish_man/features/tanks_list/data/supabase_retrieve.dart';
import 'package:flutter/cupertino.dart';
import '../models/tank.dart';

class TankProvider extends ChangeNotifier {
//List of tanks
  final List<Tank> _listOfTanks = SupabaseRetrieve().getListOfTanks();

//getter for list of tanks currently added
  List<Tank> get listOfTanks => _listOfTanks;

//adds a tank to the list
  addTank(
      {required id, required tankName, required tankSize, required occupants}) {
    _listOfTanks.add(Tank(
        id: id, tankName: tankName, tankSize: tankSize, occupants: occupants));
    notifyListeners();
  }
}
