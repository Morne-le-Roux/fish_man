import 'package:supabase_flutter/supabase_flutter.dart';

class TanklistDatabase {
  final _supabase = Supabase.instance.client;

  Stream tankStream({required ownerUID}) {
    return _supabase
        .from("tankDatabase")
        .stream(primaryKey: ["id"]).eq("owner", ownerUID);
  }

  addTankToDatabase({
    required String tankName,
    required String tankSize,
    required String owner,
  }) async {
    await _supabase.from("tankDatabase").insert({
      "owner": owner,
      "tank_name": tankName,
      "tank_size": tankSize,
    });
  }
}
