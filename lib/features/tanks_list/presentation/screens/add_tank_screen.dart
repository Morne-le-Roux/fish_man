import 'dart:io';

import 'package:fish_man/core/constants.dart';
import 'package:fish_man/features/auth/provider/current_user.dart';
import 'package:fish_man/features/tanks_list/domain/use%20cases/tanks_data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:selectable_list/selectable_list.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supa;

// ignore: must_be_immutable
class AddTankScreen extends StatefulWidget {
  const AddTankScreen({super.key});

  @override
  State<AddTankScreen> createState() => _AddTankScreenState();
}

class _AddTankScreenState extends State<AddTankScreen> {
  final TextEditingController _tankName = TextEditingController();

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    setState(() {
      _selectedPhoto = File(returnedImage.path);
    });
  }

//default starting tank size
  int _tankSize = 1;

  //list of measurement types and maximum values
  final Map<String, int> _tankMeasurement = {
    "Liters": 2000,
    "Gallons": 1000,
    "Foot": 10,
    "Inch": 200,
    "Centimeter": 1000,
  };

  //Selected tankMeasurement
  String? _selectedTankMeasurement;

  //SelectedPhoto
  File? _selectedPhoto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Tank",
          style: mainTextStyle,
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

              //selects measurement to keep
              SelectableList(
                  items: _tankMeasurement.keys.toList(),
                  itemBuilder: (context, value, selected, onTap) => ListTile(
                      title: Text(value),
                      subtitle: Text("Measure your tank in $value"),
                      onTap: onTap),
                  selectedValue: _selectedTankMeasurement,
                  onItemSelected: (value) => setState(() {
                        _tankSize = 1;
                        _selectedTankMeasurement = value;
                      }),
                  onItemDeselected: (value) => setState(() {
                        _tankSize = 1;
                        _selectedTankMeasurement = null;
                      })),

              //Tank Size Selector
              NumberPicker(
                  axis: Axis.horizontal,
                  minValue: 1,
                  maxValue: _tankMeasurement[_selectedTankMeasurement] ?? 2000,
                  value: _tankSize,
                  itemCount: 10,
                  haptics: true,
                  itemHeight: 50,
                  itemWidth: 50,
                  textStyle: mainTextStyle,
                  selectedTextStyle: mainTextStyle.copyWith(
                      color: Colors.deepPurpleAccent, fontSize: 40),
                  onChanged: (value) {
                    setState(() {
                      _tankSize = value;
                    });
                  }),

              //Photo Selector

              InkWell(
                child: Container(
                  margin: const EdgeInsets.only(top: 20, left: 8, right: 8),
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20)),
                  height: 200,
                  width: double.infinity,
                  child: Visibility(
                    visible: _selectedPhoto == null,
                    replacement: _selectedPhoto == null
                        ? const SizedBox()
                        : Image.file(
                            _selectedPhoto!,
                            fit: BoxFit.cover,
                          ), //if no photo is selected, show text to select photo
                    child: const Center(
                      child: Text("Upload a photo of your tank."),
                    ),
                  ),
                ),
                onTap: () {
                  _pickImageFromGallery();
                },
              ),
            ],
          ),

          //Add Tank Button
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(20),
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
              try {
                supa.User? currentUser =
                    Provider.of<FishManUser>(context, listen: false)
                        .currentUser;
                TanksData().addTank(
                    owner: currentUser?.id ?? "",
                    tankName: _tankName.text,
                    tankSize: "$_tankSize $_selectedTankMeasurement",
                    tankPhoto: _selectedPhoto);
                Navigator.pop(context);
              } catch (e) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(e.toString())));
              }
            },
          )
        ],
      ),
    );
  }
}
