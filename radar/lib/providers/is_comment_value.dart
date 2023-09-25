import 'package:flutter/material.dart';

class IsCommentProvider extends ValueNotifier {
  IsCommentProvider(super.value);

  void isCommentChage(bool) {
    value = bool;
  }
}