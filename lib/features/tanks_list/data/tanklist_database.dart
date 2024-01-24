import 'package:supabase_flutter/supabase_flutter.dart';
import "dart:io";

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
    required tankPhoto,
  }) async {
    await _supabase.from("tankDatabase").insert({
      "owner": owner,
      "tank_name": tankName,
      "tank_size": tankSize,
      "tank_photo_path": "$owner/$tankName",
    });
    await _supabase.storage
        .from("tank_pictures")
        .upload("$owner/$tankName", tankPhoto);
  }

  getTankImage({required String path}) async {
    var tankPhoto =
        await _supabase.storage.from('tank_pictures').download(path);

    return tankPhoto;
  }
}
