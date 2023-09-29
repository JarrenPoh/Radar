import 'package:flutter/material.dart';

class ListValueNotifier extends ValueNotifier {
  ListValueNotifier(super.value);

  void listChange(list) {
    value = list;
  }
}