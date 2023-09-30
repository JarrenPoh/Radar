import 'package:flutter/material.dart';
import 'package:radar/valueNotifier/int_value_notifier.dart';

class PostCardBloc with ChangeNotifier {
  IntValueNotifier rateValueNotifier = IntValueNotifier(0);
  

  // void catchRenderBox(GlobalObjectKey<PostCardState> key) {
  //     final BuildContext context = key.currentContext!;
  //     RenderBox renderBox = context.findRenderObject() as RenderBox;
  //     double height = renderBox.size.height;
  // }
}
