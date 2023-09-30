import 'package:flutter/material.dart';
import 'package:radar/providers/post_list/post_list_bloc.dart';

class HomePageBloc with ChangeNotifier {
  List<PostListBloc> postListBlocs = [];
  List tabList = ["CYCU", "Explore","Folllow"];
  late TabController tabController;

  HomePageBloc(){
    createBlocs(tabList.length);
  }

  void createBlocs(int length) {
    for (int index = 0; index < length; index++) {
      final bloc = PostListBloc('homeBloc${index.toString()}'); // 創建一個新的 PostListBloc
      postListBlocs.add(bloc); // 將新的 PostListBloc 添加到列表中
    }
  }

}
