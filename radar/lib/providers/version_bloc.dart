import 'package:flutter/material.dart';
import 'package:radar/providers/is_comment_value.dart';

class VersionBloc extends ChangeNotifier{
  ScrollController scrollController = ScrollController();
  TextEditingController textEditingController = TextEditingController();
  final IsCommentProvider isCommentProvider = IsCommentProvider(false);

}