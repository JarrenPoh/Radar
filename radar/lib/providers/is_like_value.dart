import 'package:flutter/material.dart';

class IsLikeProvider extends ValueNotifier {
  IsLikeProvider(super.value);

  void isLikeChage(bool) {
    value = bool;
  }
}