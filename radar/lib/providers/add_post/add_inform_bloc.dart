import 'package:flutter/material.dart';
import 'package:radar/valueNotifier/bool_value.dart';
import 'package:radar/valueNotifier/list_value.dart';

class AddInformBloc with ChangeNotifier {
  List<Map<String, dynamic>> informations = [
    {"type": "性別", "bool": true},
    {"type": "感情狀況", "bool": true},
    {"type": "綽號", "bool": true},
    {"type": "姓名", "bool": true},
    {"type": "學校", "bool": false},
    {"type": "班級", "bool": false},
    {"type": "身高", "bool": false},
    {"type": "年紀", "bool": false},
    {"type": "生日", "bool": false},
    {"type": "星座", "bool": false},
    {"type": "血型", "bool": false},
    {"type": "興趣專長", "bool": false},
  ];
  final BoolValueNotifier addInformNotifier = BoolValueNotifier(false);

  //gender
  int selectedGender = 0;
  String genderFirst = "男";
  String genderSecond = "女";
  //

  //single
  int selectedSingle = 0;
  String singleFirst = "單身";
  String singleSecond = "交往";
  //

  //nickName
  final TextEditingController nickNameController = TextEditingController();
  FocusNode nickNameFocusNode = FocusNode();
  bool isNickName = false;
  void isNickNameChange(value){
    isNickName = value;
    notifyListeners();
  }
  //

  //realName
  final TextEditingController realNameController = TextEditingController();
  FocusNode realNameFocusNode = FocusNode();
  bool isRealName = false;
  void isRealNameChange(value){
    isRealName = value;
    notifyListeners();
  }
  //

  //school
  final TextEditingController schoolController = TextEditingController();
  FocusNode schoolFocusNode = FocusNode();
  String school = '學校';
  bool isSchool = false;
  final ListValueNotifier schoolListNotifier = ListValueNotifier([]);
  List<String> schools = [
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

  //class
  final TextEditingController classController = TextEditingController();
  FocusNode classFocusNode = FocusNode();
  //

  //height
  int initHeight = 20;
  List<int> heightList = List.generate(61, (index) => index + 140);
  String height = "身高";
  bool isHeight = false;
  String unitOfHeight = 'cm';
  //

  //age
  int iniAge = 0;
  List<int> ageList = List.generate(13, (index) => index + 18);
  String age = "年紀";
  bool isAge = false;
  String unitOfAge = '歲';
  //

  //starSign
  int iniStarSign = 0;
  List starSignList = [
    '牡羊座',
    '金牛座',
    '雙子座',
    '巨蟹座',
    '獅子座',
    '處女座',
    '天秤座',
    '天蠍座',
    '射手座',
    '摩羯座',
    '水瓶座',
    '雙魚座',
  ];
  String starSign = "星座";
  bool isStarSign = false;
  String unitOfStarSign = "";
  //

  //bloodType
  int iniBloodType = 0;
  List bloodTypeList = [
    'A',
    'B',
    'AB',
    'O',
  ];
  String bloodType = "血型";
  bool isBloodType = false;
  String unitOfBloodType = '型';
  //

  //hobby
  final TextEditingController hobbyController = TextEditingController();
  FocusNode hobbyFocusNode = FocusNode();
  //
}
