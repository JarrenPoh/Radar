import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:radar/providers/comment_bloc.dart';
import 'package:radar/providers/information_bloc.dart';
import 'package:radar/providers/post_detail_bloc.dart';
import 'package:radar/providers/version_bloc.dart';
import 'package:radar/screens/post_detail/post_detail.dart';
import 'package:radar/theme/dark_theme.dart';
import 'package:radar/theme/light_theme.dart';
import 'navigation_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const NavigationContainer(),
    );
  }
}
