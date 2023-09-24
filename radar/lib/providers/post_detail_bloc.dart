import 'package:flutter/material.dart';
import 'package:radar/providers/comment_bloc.dart';
import 'package:radar/providers/information_bloc.dart';
import 'package:radar/providers/version_bloc.dart';

class PostDetailBloc extends ChangeNotifier {
  late TabController tabController;
  List tabList = ["information", "comment(30)", "version(1.0.0)"];
   InformationBloc informationBloc = InformationBloc();
   CommentBloc commentBloc = CommentBloc();
   VersionBloc versionBloc = VersionBloc();
  final ScrollController informationScroll = ScrollController();
  final ScrollController commentScroll = ScrollController();
  final ScrollController versionScroll = ScrollController();

}
