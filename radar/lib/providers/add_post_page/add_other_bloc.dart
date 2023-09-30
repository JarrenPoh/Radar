import 'package:flutter/material.dart';
import 'package:radar/valueNotifier/bool_value.dart';
import 'package:radar/valueNotifier/list_value.dart';

class AddOtherBloc with ChangeNotifier {
  //others
  List<Map<String, dynamic>> others = [
    {"type": "其他敘述", "bool": true},
    {"type": "新增管理員", "bool": false},
  ];
  final BoolValueNotifier addOtherNotifier = BoolValueNotifier(false);

  //managers
  final TextEditingController managerController = TextEditingController();
  FocusNode managerFocusNode = FocusNode();
  List<String> managersChose = [];
  bool ismanager = false;
  final ListValueNotifier managerListNotifier = ListValueNotifier([]);
  List<String> managers = [
    '國立中山大學',
    '國立中央大學',
    '國立中正大學',
    '國立中興大學',
    '國立交通大學',
    '國立成功大學',
    '國立宜蘭大學',
    '國立金門大學',
    '國立空中大學',
    '國立屏東大學',
    '國立政治大學',
    '國立高雄大學',
    '國立高雄師範大學',
    '國立清華大學',
    '國立陽明大學',
    '國立新竹教育大學',
    '國立嘉義大學',
    '國立彰化師範大學',
    '國立暨南國際大學',
    '國立臺中教育大學',
    '國立臺北大學',
    '國立臺北教育大學',
    '國立臺北藝術大學',
    '國立台東大學',
    '國立臺南大學',
    '國立臺南藝術大學',
    '國立臺灣大學',
    '國立臺灣師範大學',
    '國立臺灣海洋大學',
    '國立臺灣藝術大學',
    '國立臺灣體育運動大學',
    '國立聯合大學',
    '國立體育大學',
    '臺北市立大學',
    '高雄市立空中大學',
  ];
  //

  //otherContent
  final TextEditingController otherContentController = TextEditingController();
  FocusNode otherContentFocusNode = FocusNode();
  bool isOtherContent = false;
  void isOtherContentChange(value){
    isOtherContent = value;
  }
  //
}
