import 'package:fish_man/features/tankinfo_screen/presentation/widgets/subentry.dart';
import 'package:flutter/widgets.dart';

class SubEntriesProvider extends ChangeNotifier {
  final List<Subentry> _listOfSubEntries = [];

  addSubEntry(subentry) {
    _listOfSubEntries.add(subentry);
    notifyListeners();
  }

  List<Subentry> get listOfSubEntries => _listOfSubEntries;
}
