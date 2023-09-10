import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  textTheme: GoogleFonts.varelaRoundTextTheme(),
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(backgroundColor: Colors.black),
  dividerTheme: DividerThemeData(color: Colors.grey[800]),
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    onPrimary: Color.fromARGB(255, 19, 19, 19),
    onSecondary: Colors.white,
    primary: Color.fromRGBO(237, 237, 237, 1),
    secondary: Colors.grey,
    primaryContainer: Color.fromARGB(255, 37, 37, 37),
  ),
);
