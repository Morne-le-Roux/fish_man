import 'package:fish_man/features/tankinfo_screen/presentation/widgets/subentry.dart';
import 'package:flutter/material.dart';
import 'package:selectable_list/selectable_list.dart';

class NewEntryScreen extends StatelessWidget {
  NewEntryScreen({super.key});

  final List<Widget> _entryList = [
    const Subentry(shortName: "pH", fullName: "pH"),
    const Subentry(shortName: "Ammonia", fullName: "Ammonia"),
    const Subentry(shortName: "Nitrite", fullName: "Nitrite"),
    const Subentry(shortName: "Nitrates", fullName: "Nitrates"),
    const Subentry(shortName: "TDS", fullName: "Total Dissolved Solids"),
    const Subentry(shortName: "GH", fullName: "General Hardness"),
    const Subentry(shortName: "KH", fullName: "Carbonate Hardness"),
  ];

  final List<Widget> _entriesToSend = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TODO: Add tank name to appBar.
        title: const Text("New Entry for 'Tank Name'"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //subentries
          ListView(
            shrinkWrap: true,
            children: _entriesToSend,
          ),

          //Add icon to add a subentry
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0),
              child: Icon(Icons.add),
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 800, //TODO: This doesnt work.
                    child: ListView(
                      children: _entryList,
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}

// SelectableList(
//             items: _entryList,
//             selectedValue: _currentSelected,
//             onItemSelected: (value) => setState(
//               () {
//                 _entriesToSend.add(value);
//                 _currentSelected = value;
//               },
//             ),
//             onItemDeselected: (value) => setState(
//               () {
//                 _currentSelected = null;
//               },
//             ),
//             itemBuilder: (context, value, selected, onTap) => ListTile(
//               title: Text(value.fieldName),
//               subtitle: Text("The amount of ${value.fieldName} in your tank."),
//               onTap: onTap,

//               //InputField
//               trailing: Container(
//                 width: 20,
//                 decoration: BoxDecoration(
//                   border: Border.all(width: 3),
//                 ),
//                 child: const TextField(
//                   decoration: InputDecoration(border: InputBorder.none),
//                 ),
//               ),
//             ),
//           )