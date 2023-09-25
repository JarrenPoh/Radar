import 'package:flutter/material.dart';
import 'package:radar/providers/vote_number_value.dart';

class PostCardBloc with ChangeNotifier {
  VoteNumberProvider valueNumberProvider = VoteNumberProvider(0);
  

  // void catchRenderBox(GlobalObjectKey<PostCardState> key) {
  //     final BuildContext context = key.currentContext!;
  //     RenderBox renderBox = context.findRenderObject() as RenderBox;
  //     double height = renderBox.size.height;
  // }
}
