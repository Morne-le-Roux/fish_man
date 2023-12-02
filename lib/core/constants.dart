import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.cyan,
  colorScheme: const ColorScheme.dark(),
);

ThemeData lightTheme = ThemeData();

TextStyle mainTextStyle = GoogleFonts.oswald(fontSize: 30);
TextStyle secondaryTextStyle = mainTextStyle.copyWith(fontSize: 15);
