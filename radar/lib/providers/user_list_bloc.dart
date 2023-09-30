import 'package:flutter/material.dart';

class UserListBloc with ChangeNotifier {
  ScrollController scrollController = ScrollController();
  //search
  TextEditingController textEditingController = TextEditingController();
  bool isSearch = false;
  void isSearchChange(value) {
    isSearch = value;
    notifyListeners();
  }

  //
  List userList = [
    "中原金剛",
    "中原帥哥",
    "中原美女",
    "中原正美",
    "中原小帥",
    "中原大醜",
    "中原金剛",
    "中原帥哥",
    "中原美女",
    "中原正美",
    "中原小帥",
    "中原大醜",
  ];
  List bioList = [
    "中原金剛",
    "中原帥哥",
    "中原美女",
    "中原正美",
    "中原小帥",
    "中原大醜",
    "中原金剛",
    "中原帥哥",
    "中原美女",
    "中原正美",
    "中原小帥",
    "中原大醜",
  ];
}
