import 'package:fish_man/features/tankinfo_screen/data/tank_entries_database.dart';
import 'package:fish_man/features/tankinfo_screen/models/tank_entry.dart';
import 'package:flutter/widgets.dart';

class TankEntriesProvider extends ChangeNotifier {
  final List<TankEntry> _listOfEntries = [];
  final int _tankID;

  TankEntriesProvider({required int tankID}) : _tankID = tankID {
    var data = TankEntriesDatabase().getListOfTankEntries(_tankID);
    for (var entry in data) {
      _listOfEntries.add(TankEntry(data: entry));
    }
  }

  List<TankEntry> get listOfEntries => _listOfEntries;
}
