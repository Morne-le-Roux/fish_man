import 'package:fish_man/features/tanks_list/data/tanklist_database.dart';
import "dart:io";

class Tank {
  final int id;
  final String tankName;
  final String tankSize;
  List<String>? occupants;
  final String tankPhotoPath;
  late Future<dynamic> tankPhoto;

  Tank({
    required this.id,
    required this.tankName,
    required this.tankSize,
    this.occupants,
    required this.tankPhotoPath,
  }) {
    TanklistDatabase tankDB = TanklistDatabase();
    tankPhoto = tankDB.getTankImage(path: tankPhotoPath);
  }
}
