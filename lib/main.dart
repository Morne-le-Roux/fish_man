import 'package:fish_man/core/constants.dart';
import 'package:fish_man/features/auth/presentation/screens/register_screen.dart';
import 'package:fish_man/features/tanks_list/presentation/screens/tanks_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import './core/supabase_settings.dart';

Future<void> main() async {
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const RegisterScreen(),
      darkTheme: darkTheme,
      theme: lightTheme,
    );
  }
}
