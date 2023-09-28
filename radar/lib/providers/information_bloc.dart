import 'package:flutter/material.dart';

class InformationBloc extends ChangeNotifier {
  ScrollController scrollController = ScrollController();

  List<String> informations = [
    "姓名",
    "學校",
    "班級",
    "身高",
    "年紀",
    "生日",
    "星座",
    "血型",
    "興趣專長",
    "筆者（總管理員）",
  ];
  List<String> answers = [
    "天上天",
    "中原大學",
    "資管三乙",
    "170cm",
    "18",
    "0903",
    "處女座",
    "O型",
    "踢足球，看Netflix",
    "中原播報員",
  ];
}
