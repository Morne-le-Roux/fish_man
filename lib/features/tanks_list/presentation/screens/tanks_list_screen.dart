import 'package:fish_man/features/tanks_list/data/supabase_retrieve.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () async {
            SupabaseRetrieve supabaseRetrieve = SupabaseRetrieve();
            print(await supabaseRetrieve.getListOfTanks());
          },
          child: Container(
            color: Colors.blue,
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }
}
