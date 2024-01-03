import 'package:supabase_flutter/supabase_flutter.dart';

class TanklistDatabase {
  final _supabase = Supabase.instance.client;

  getListOfTanks() async {
    final data = await _supabase.from("tankDatabase").select();
    return data;
  }

  Stream taskStream({required ownerUID}) {
    return _supabase
        .from("tankDatabase")
        .stream(primaryKey: ["id"]).eq("owner", ownerUID);
  }

  addTankToDatabase({
    required String tankName,
    required int tankSize,
    required String owner,
  }) async {
    await _supabase.from("tankDatabase").insert({
      "owner": owner,
      "tank_name": tankName,
      "tank_size": tankSize,
    });
  }
}
