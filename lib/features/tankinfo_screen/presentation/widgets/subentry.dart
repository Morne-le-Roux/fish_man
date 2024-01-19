import 'package:flutter/material.dart';

class Subentry extends StatefulWidget {
  const Subentry(
      {super.key,
      required this.shortName,
      required this.fullName,
      required this.controller});

  final String shortName;
  final String fullName;
  final TextEditingController controller;

  @override
  State<Subentry> createState() => _SubentryState();
}

class _SubentryState extends State<Subentry> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    String? description;

//Special descriptions for some entries.
    switch (widget.shortName) {
      case "pH":
        description = "The acidity/alkalinity of your tank.";
        break;
      case "GH":
        description = "The General Hardness of your tank.";
        break;
      case "KH":
        description = "The Carbonte Hardness of your tank.";
        break;
      default:
        description = "The amount of ${widget.fullName} in your tank.";
    }

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black26),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.shortName,
                style: TextStyle(
                    color: _active ? Colors.white : Colors.white24,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                description,
                style: TextStyle(
                  color: _active ? Colors.white : Colors.white24,
                ),
              ),
            ],
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(),
              ),
            ),
            width: 50,
            child: TextField(
              //SETS COLOR OF TEXT, BEING ACTIVE OR INACTIVE
              onChanged: (value) {
                setState(() {
                  if (widget.controller.text == "") {
                    _active = false;
                  }
                  if (widget.controller.text != "") {
                    _active = true;
                  }
                });
              },
              controller: widget.controller,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
