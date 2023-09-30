import 'package:flutter/material.dart';
import 'package:radar/providers/add_post_page/add_inform_bloc.dart';
import 'package:radar/providers/add_post_page/add_other_bloc.dart';
import 'package:radar/providers/add_post_page/add_picture_bloc.dart';


class AddPostPageBloc with ChangeNotifier {
  final PageController pageController = PageController();
  List<Widget> pageWidget = [];
  final AddPictureBloc addPictureBloc = AddPictureBloc();
  final AddInformBloc addInfomBloc = AddInformBloc();
  final AddOtherBloc addOtherBloc = AddOtherBloc();
  int itemCount = 0;
}
