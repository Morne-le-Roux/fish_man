import 'dart:typed_data';

import 'package:fish_man/core/constants.dart';
import 'package:fish_man/features/tankinfo_screen/presentation/screens/tank_info_screen.dart';
import 'package:fish_man/features/tanks_list/data/tanklist_database.dart';
import 'package:fish_man/features/tanks_list/domain/models/tank.dart';
import "package:flutter/material.dart";
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class TankWidget extends StatefulWidget {
  TankWidget({
    super.key,
    required this.tank,
  });

  final Tank tank;
  File? tankPhoto;

  @override
  State<TankWidget> createState() => _TankWidgetState();
}

class _TankWidgetState extends State<TankWidget> {
  bool _loading = true;

  //get tank image from
  void getTankImage(tankPhotoPath) async {
    TanklistDatabase tankDB = TanklistDatabase();
    var response = await tankDB.getTankImage(path: tankPhotoPath);

    // Uint8List imageInUnit8List = response;
    // final tempDir = await getTemporaryDirectory();
    // File file = await File('${tempDir.path}/image.png').create();
    // file.writeAsBytesSync(imageInUnit8List);

    setState(() {
      widget.tankPhoto = response;

      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    getTankImage(widget.tank.tankPhotoPath);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TankInfoScreen(
                    tankID: widget.tank.id,
                    tankName: widget.tank.tankName,
                  ))), //PUSHES TANK INFO SCREEN
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 10,
          child: Container(
            padding: const EdgeInsets.all(12),
            height: 200,
            child: Stack(
              children: [
                widget.tankPhoto == null
                    ? const SizedBox()
                    : Image.file(widget.tankPhoto!),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.tank.tankName,
                      style: mainTextStyle,
                    ),
                    Text(
                      widget.tank.tankSize,
                      style: secondaryTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
