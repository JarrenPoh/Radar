import 'package:flutter/material.dart';
import 'package:radar/providers/post_list/post_list_bloc.dart';
import 'package:radar/providers/search_page/search_history_bloc.dart';
import 'package:radar/providers/user_list_bloc.dart';

class SearchPageBloc with ChangeNotifier {
  PostListBloc postListBloc = PostListBloc('search');
  UserListBloc userListBloc = UserListBloc();
  SearchHistoryBloc historyPostBloc = SearchHistoryBloc();
  SearchHistoryBloc historyUserBloc = SearchHistoryBloc();
  List tabList = ["找貼文", "找用戶"];
  late TabController tabController;
  bool isPost = true;
  void isPostChange(value){
    isPost = value;
    notifyListeners();
  }

  searchPageBloc() {}
}
