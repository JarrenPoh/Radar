import 'package:flutter/material.dart';

class VoteNumberProvider extends ValueNotifier {
  VoteNumberProvider(super.value);

  void numberChange(int) {
    value = int;
  }
}