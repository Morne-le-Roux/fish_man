import 'package:fish_man/core/constants.dart';
import 'package:fish_man/features/auth/provider/current_user.dart';
import 'package:fish_man/features/tanks_list/domain/use%20cases/tanks_data.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supa;

// ignore: must_be_immutable
class AddTankScreen extends StatefulWidget {
  const AddTankScreen({super.key});

  @override
  State<AddTankScreen> createState() => _AddTankScreenState();
}

class _AddTankScreenState extends State<AddTankScreen> {
  final TextEditingController _tankName = TextEditingController();

//default starting tank size
  int _tankSize = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Tank",
          style: mainTextStyle,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //TANK NAME
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _tankName,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Tank Name"),
              style: mainTextStyle.copyWith(fontSize: 50),
            ),
          ),

          //Tank Size Selector
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //spacing

              //size selector
              NumberPicker(
                  minValue: 1,
                  maxValue: 10000,
                  value: _tankSize,
                  itemCount: 3,
                  haptics: true,
                  itemHeight: 50,
                  itemWidth: 80,
                  textStyle: mainTextStyle,
                  selectedTextStyle: mainTextStyle.copyWith(
                      color: Colors.deepPurpleAccent, fontSize: 40),
                  onChanged: (value) {
                    setState(() {
                      _tankSize = value;
                    });
                  }),
              Text(
                "Liters",
                style: mainTextStyle,
              )
            ],
          ),

          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "Add Tank",
                style: secondaryTextStyle,
              ),
            ),
            onTap: () {
              supa.User? currentUser =
                  Provider.of<FishManUser>(context, listen: false).currentUser;
              TanksData().addTank(
                  owner: currentUser?.id ?? "",
                  tankName: _tankName.text,
                  tankSize: _tankSize);

              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
