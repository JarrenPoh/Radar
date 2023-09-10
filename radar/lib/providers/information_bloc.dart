import 'package:flutter/material.dart';

class InformationBloc with ChangeNotifier {
   ScrollController scrollController = ScrollController();
  List<String> informations = [
    "姓名",
    "學校",
    "班級",
    "年紀",
    "生日",
    "星座",
    "血型",
    "興趣專長",
    "其他內容",
    "總管理員",
    "管理員",
  ];
}
