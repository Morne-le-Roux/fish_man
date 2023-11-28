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
    return Material(
      elevation: 5,
      child: Container(),
    );
  }
}
