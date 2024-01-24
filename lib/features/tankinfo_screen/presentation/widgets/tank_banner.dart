import "package:fish_man/core/constants.dart";
import "package:flutter/material.dart";

class TankBanner extends StatelessWidget {
  const TankBanner({super.key, required this.tankName});

  final String tankName;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (bounds) {
          return const LinearGradient(
            colors: [
              Colors.transparent,
              Colors.black,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ).createShader(bounds);
        },
        blendMode: BlendMode.dstIn,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade400,
          ),
          height: 200,
          width: double.infinity,
          child: Center(
              child: Text(
            tankName,
            style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          )),
        ));
  }
}
