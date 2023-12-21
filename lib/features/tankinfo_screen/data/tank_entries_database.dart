import 'package:supabase_flutter/supabase_flutter.dart';

class TankEntriesDatabase {
  final _supabase = Supabase.instance.client;

  getListOfTankEntries(tankID) async {
    final data = await _supabase.from("tankEntries").select().eq("id", tankID);

    return data;
  }

  deleteTank(tankID) async {
    await _supabase.from("tankDatabase").delete().eq("id", tankID);
  }
}
