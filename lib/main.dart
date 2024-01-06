import 'package:fish_man/core/constants.dart';
import 'package:fish_man/features/auth/presentation/screens/login_screen.dart';
import 'package:fish_man/features/auth/provider/current_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import './core/supabase_settings.dart';

Future<void> main() async {
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(ChangeNotifierProvider(
      create: (context) => FishManUser(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginScreen(),
      darkTheme: darkTheme,
      theme: lightTheme,
    );
  }
}
