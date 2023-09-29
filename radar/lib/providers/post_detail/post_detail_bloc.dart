import 'package:flutter/material.dart';
import 'package:radar/providers/post_detail/comment_bloc.dart';
import 'package:radar/providers/post_detail/information_bloc.dart';
import 'package:radar/valueNotifier/bool_value.dart';
import 'package:radar/providers/post_detail/version_bloc.dart';

class PostDetailBloc extends ChangeNotifier {
  late TabController tabController;
  List tabList = ["information", "comment(30)", "version(1.0.0)"];
  InformationBloc informationBloc = InformationBloc();
  CommentBloc commentBloc = CommentBloc();
  VersionBloc versionBloc = VersionBloc();
  final ScrollController informationScroll = ScrollController();
  final ScrollController commentScroll = ScrollController();
  final ScrollController versionScroll = ScrollController();
  BoolValueNotifier likeValueNotifier = BoolValueNotifier(false);
}
