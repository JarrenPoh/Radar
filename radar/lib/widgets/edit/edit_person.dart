import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radar/global/dimension.dart';
import 'package:radar/global/regular_text.dart';
import 'package:radar/widgets/custom/custom_modal_popup.dart';

class EditPerson extends StatefulWidget {
  final bool isChose;
  final String chose;
  final int iniChose;
  final List choseList;
  final String unit;
  const EditPerson({
    super.key,
    required this.chose,
    required this.iniChose,
    required this.isChose,
    required this.choseList,
    required this.unit,
  });

  @override
  State<EditPerson> createState() => _EditPersonState(
        chose: chose,
        isChose: isChose,
        iniChose: iniChose,
        choseList: choseList,
      );
}

class _EditPersonState extends State<EditPerson> {
  _EditPersonState({
    required this.chose,
    required this.iniChose,
    required this.isChose,
    required this.choseList,
  });
  bool isChose;
  String chose;
  int iniChose;
  List choseList;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color color_title = Theme.of(context).colorScheme.primary;
    Color color_container = Theme.of(context).colorScheme.primaryContainer;

    return CupertinoButton(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color_container,
          borderRadius: BorderRadius.circular(Dimensions.height5),
        ),
        padding: EdgeInsets.symmetric(vertical: Dimensions.height5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.centerRight,
              children: [
                RegularText(
                  color: color_title,
                  size: Dimensions.height2 * 8,
                  text: !isChose ? chose + '        ' : chose + widget.unit,
                ),
                if (!isChose) Icon(Icons.arrow_drop_down_outlined),
              ],
            ),
          ],
        ),
      ),
      onPressed: () {
        CustomModalPopup(
          context,
          choseList,
          iniChose,
          chose,
          isChose,
          (value) {
            setState(() {
              chose = value['chose'];
              iniChose = value['iniChose'];
              isChose = value['isChose'];
            });
          },
        );
      },
    );
  }
}
