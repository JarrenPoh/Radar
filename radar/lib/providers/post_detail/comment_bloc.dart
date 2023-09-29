import 'package:flutter/material.dart';
import 'package:radar/valueNotifier/bool_value.dart';

class CommentBloc extends ChangeNotifier {
  ScrollController scrollController = ScrollController();
  TextEditingController textEditingController = TextEditingController();
  final BoolValueNotifier isCommentProvider = BoolValueNotifier(false);
}

