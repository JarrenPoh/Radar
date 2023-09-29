import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radar/global/dimension.dart';

Future<void> CustomModalPopup(
  BuildContext context,
  List choseList,
  int iniChose,
  String chose,
  bool isChose,
  ValueChanged<Map> onValueChanged,
) {
  Color color_onPrimary = Theme.of(context).colorScheme.onPrimary;

  return showCupertinoModalPopup(
    context: context,
    builder: (_) {
      return SizedBox(
        width: double.infinity,
        height: Dimensions.height5 * 50,
        child: CupertinoPicker(
          backgroundColor: color_onPrimary,
          itemExtent: 30,
          scrollController: FixedExtentScrollController(
            initialItem: iniChose,
          ),
          onSelectedItemChanged: (int value) {
            chose = choseList[value].toString();
            iniChose = value;
            isChose = true;
            onValueChanged({
              "chose": choseList[value].toString(),
              "isChose": true,
              "iniChose": value,
            });
          },
          children: List.generate(
            choseList.length,
            (index) => Text(
              (choseList[index]).toString(),
            ),
          ),
        ),
      );
    },
  );
}
