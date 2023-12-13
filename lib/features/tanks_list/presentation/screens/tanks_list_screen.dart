import 'package:fish_man/core/constants.dart';
import 'package:fish_man/features/tanks_list/presentation/screens/add_tank_screen.dart';
import 'package:fish_man/features/tanks_list/presentation/widgets/tank_widget.dart';
import 'package:fish_man/features/tanks_list/provider/tank_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TanksListScreen extends StatelessWidget {
  const TanksListScreen({super.key});

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
      body: ChangeNotifierProvider(
        create: (context) => TankProvider(),
        child: Consumer<TankProvider>(
          builder: (context, tankProvider, child) {
            return ListView.builder(
              itemCount: tankProvider.listOfTanks.length,
              itemBuilder: (BuildContext context, int index) {
                return TankWidget(tank: tankProvider.listOfTanks[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
