import 'package:supabase_flutter/supabase_flutter.dart';

class TanklistData {
  final supabase = Supabase.instance.client;

  getListOfTanks() async {
    final data = await supabase.from("tankDatabase").select();
    return data;
  }

  addTankToDatabase({
    required String tankName,
    required int tankSize,
  }) async {
    await supabase.from("tankDatabase").insert({
      "tank_name": tankName,
      "tank_size": tankSize,
    });
  }
}
