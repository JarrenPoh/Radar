import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:radar/global/colors.dart';

ThemeData lightTheme = ThemeData(
  textTheme: GoogleFonts.varelaRoundTextTheme(),
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(backgroundColor: Colors.white),
  dividerTheme: DividerThemeData(
    color: Colors.grey[400]
  ),
  colorScheme: ColorScheme.light(
    background: Color.fromRGBO(237, 237, 237, 1),
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    primary: Color.fromRGBO(54, 54, 54, 1),
    secondary: Colors.grey,
    primaryContainer: Colors.grey[200]
  ),
);