import 'package:flutter/material.dart';
import 'package:radar/providers/post_card_bloc.dart';
import '../screens/post_list/post_card.dart';

class PostListBloc with ChangeNotifier {
  List<PostCardBloc> postCardBlocs = [];
  ScrollController scrollController = ScrollController();
  List<GlobalObjectKey<PostCardState>> cardKeyList = [];
  List<String> heroTagList = [];
  List imgList = [
    "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVvcGxlfGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60",
    "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cGVvcGxlfGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60",
    "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cGVvcGxlfGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60",
    "https://images.unsplash.com/photo-1488161628813-04466f872be2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=400&q=60",
    "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=400&q=60",
    "https://plus.unsplash.com/premium_photo-1669882305339-8e2cbb81903e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDF8fHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=400&q=60",
    "https://plus.unsplash.com/premium_photo-1675129933526-5eb24a763248?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjV8fHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=400&q=60",
    "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjd8fHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=400&q=60",
    "https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzh8fHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=400&q=60",
  ];
  List isManList = [false, false, true, true, false, true, true, false, false];

  PostListBloc(String str) {
    createKey(imgList.length, str);
    createHeroTags(imgList.length, str);
    createBlocs(imgList.length);
  }

  void createKey(int postLength, String str) {
    cardKeyList = List.generate(
        postLength, (index) => GlobalObjectKey<PostCardState>('$str$index'));
  }

  void createHeroTags(int postLength, String str){
    heroTagList = List.generate(postLength, (index) => '$str$index');
  }

  void createBlocs(int length) {
    for (int index = 0; index < length; index++) {
      final bloc = PostCardBloc(); // 創建一個新的 PostListBloc
      postCardBlocs.add(bloc); // 將新的 PostListBloc 添加到列表中
    }
  }

  // void NavigateToPage(BuildContext context, int index) {
  //   final RenderBox renderBox =
  //       cardKeyList[index].currentContext!.findRenderObject() as RenderBox;
  //   final cardPosition = renderBox.localToGlobal(Offset.zero);
  //   final cardSize = renderBox.size;
  //   print('cardPosition: $cardPosition');
  //   print('cardSize: $cardSize');
  // }
}
