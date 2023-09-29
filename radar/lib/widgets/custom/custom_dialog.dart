import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radar/global/colors.dart';
import 'package:radar/global/dimension.dart';
import 'package:radar/global/medium_text.dart';
import 'package:radar/global/regular_text.dart';

Future CustomDialog(
    context, title, content, color_title, color_content, onPress) {
  return showDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: RegularText(
          color: color_title,
          size: Dimensions.height2 * 6,
          text: '',
        ),
        content: MediumText(
          color: color_content,
          size: Dimensions.height2 * 8,
          text: content,
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            child: MediumText(
              color: color_man,
              size: Dimensions.height2 * 8,
              text: '取消',
            ),
          ),
          CupertinoDialogAction(
            onPressed: () => onPress(),
            child: MediumText(
              color: color_woman,
              size: Dimensions.height2 * 8,
              text: '確定',
            ),
          ),
        ],
      );
    },
  );
}
