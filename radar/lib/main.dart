import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:radar/providers/add_post_page/add_inform_bloc.dart';
import 'package:radar/providers/add_post_page/add_other_bloc.dart';
import 'package:radar/providers/post_list/post_list_bloc.dart';
import 'package:radar/providers/search_page/search_page_bloc.dart';
import 'package:radar/providers/user_list_bloc.dart';
import 'package:radar/theme/dark_theme.dart';
import 'package:radar/theme/light_theme.dart';
import 'navigation_container.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> _cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _cameras = await availableCameras();
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
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AddInformBloc(),
          ),
          ChangeNotifierProvider(
            create: (context) => AddOtherBloc(),
          ),
          ChangeNotifierProvider(
            create: (context) => SearchPageBloc(),
          ),
          ChangeNotifierProvider(
            create: (context) => PostListBloc(''),
          ),
          ChangeNotifierProvider(
            create: (context) => UserListBloc(),
          ),
        ],
        child: const NavigationContainer(),
      ),
    );
  }
}
