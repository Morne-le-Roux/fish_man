import 'package:supabase_flutter/supabase_flutter.dart';

class TankEntriesDatabase {
  final supabase = Supabase.instance.client;

  getListOfTankEntries(tankID) async {
    final data = await supabase
        .from("tankEntries")
        .select("tankID")
        .eq("tankID", tankID);
    return data;
  }
}
