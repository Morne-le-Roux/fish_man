import 'package:fish_man/core/constants.dart';
import 'package:fish_man/features/tanks_list/domain/models/tank.dart';
import 'package:fish_man/features/tanks_list/domain/use%20cases/tanks_data.dart';
import 'package:fish_man/features/tanks_list/presentation/screens/add_tank_screen.dart';
import 'package:fish_man/features/tanks_list/presentation/widgets/tank_widget.dart';
import 'package:flutter/material.dart';

class TanksListScreen extends StatefulWidget {
  const TanksListScreen({super.key});

  @override
  State<TanksListScreen> createState() => _TanksListScreenState();
}

class _TanksListScreenState extends State<TanksListScreen> {
  List _listOfTanks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fish Man",
          style: mainTextStyle,
        ),
        actions: [
          InkWell(
              //sends user to add tank screen
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddTankScreen()));
              },

              //what to display in the button
              child: const Icon(
                  Icons.add_rounded)), //TODO: Implement add tank function

          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: StreamBuilder(
        stream: TanksData().tanksStream(context: context),
        builder: (context, snapshot) {
          //clear list of tanks first
          _listOfTanks = [];
          //if there is not data yet, show a loading screen
          //TODO: update to match loading screen theme
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          for (var tank in snapshot.data) {
            _listOfTanks.add(Tank(
                id: tank["id"],
                tankName: tank["tank_name"],
                tankSize: tank["tank_size"]));
          }

          return ListView.builder(
            itemCount: _listOfTanks.length,
            itemBuilder: (BuildContext context, int index) {
              return TankWidget(tank: _listOfTanks[index]);
            },
          );
        },
      ),
    );
  }
}
