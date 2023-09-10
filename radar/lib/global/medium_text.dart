import 'dart:ffi';

import 'package:flutter/material.dart';

class MediumText extends StatelessWidget {
  Color color;
  double size;
  int? maxLines;
  String text;
  MediumText({
    super.key,
    required this.color,
    this.maxLines,
    required this.size,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontFamily: "NotoSansMedium",
      ),
    );
  }
}
