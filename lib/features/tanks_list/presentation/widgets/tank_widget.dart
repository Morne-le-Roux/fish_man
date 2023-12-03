import 'package:fish_man/core/constants.dart';
import 'package:fish_man/features/tankinfo_screen/presentation/screens/tank_info_screen.dart';
import 'package:fish_man/features/tanks_list/models/tank.dart';
import "package:flutter/material.dart";

class TankWidget extends StatelessWidget {
  const TankWidget({
    super.key,
    required this.tank,
  });

  final Tank tank;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  TankInfoScreen(tankID: tank.id))), //PUSHES TANK INFO SCREEN
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 10,
          color: Colors.blueGrey.shade400,
          child: Container(
            padding: const EdgeInsets.all(12),
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tank.tankName,
                  style: mainTextStyle,
                ),
                Text(
                  "${tank.tankSize} Gallon",
                  style: secondaryTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
