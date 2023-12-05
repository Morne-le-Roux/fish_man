import 'package:fish_man/features/tankinfo_screen/data/tank_entries_database.dart';
import 'package:fish_man/features/tankinfo_screen/models/tank_entry.dart';
import 'package:flutter/widgets.dart';

class TankEntriesProvider extends ChangeNotifier {
  late final List<TankEntry> _listOfEntries = [];
  final int _tankID;
  final TankEntriesDatabase _database = TankEntriesDatabase();

  TankEntriesProvider({required int tankID}) : _tankID = tankID {
    initTankEntries(tankID);
  }

  initTankEntries(tankID) async {
    var data = await _database.getListOfTankEntries(_tankID);
    for (var entry in data) {
      _listOfEntries.add(TankEntry(data: entry));
      notifyListeners();
    }
  }

  List<TankEntry> get listOfEntries => _listOfEntries;
}
