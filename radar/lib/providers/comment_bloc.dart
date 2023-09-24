import 'package:flutter/material.dart';

class CommentBloc extends ChangeNotifier {
  ScrollController scrollController = ScrollController();
  TextEditingController textEditingController = TextEditingController();
  final IsCommentProvider isCommentProvider = IsCommentProvider(false);
}

class IsCommentProvider extends ValueNotifier {
  IsCommentProvider(super.value);

  void isCommentChage(bool) {
    value = bool;
  }
}
