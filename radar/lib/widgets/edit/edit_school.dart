import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radar/global/dimension.dart';
import 'package:radar/global/regular_text.dart';
import 'package:radar/valueNotifier/list_value.dart';
import 'package:radar/widgets/custom/custom_modal_sheet.dart';

// ignore: must_be_immutable
class EditSchool extends StatefulWidget {
  final TextEditingController textEditingController;
  final List<String> list;
  final ListValueNotifier listValueNotifier;
  bool isChose;
  String chose;
  final FocusNode focusNode;
  EditSchool({
    super.key,
    required this.isChose,
    required this.list,
    required this.listValueNotifier,
    required this.textEditingController,
    required this.chose,
    required this.focusNode,
  });

  @override
  State<EditSchool> createState() => _EditSchoolState();
}

class _EditSchoolState extends State<EditSchool> {

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
                  text: !widget.isChose
                      ? '${widget.chose}        '
                      : widget.chose,
                ),
                if (!widget.isChose) Icon(Icons.arrow_drop_down_outlined),
              ],
            ),
          ],
        ),
      ),
      onPressed: () {
        CustomModalSheet(
            context,
            widget.focusNode,
            widget.textEditingController,
            widget.list,
            widget.listValueNotifier, (value) {
          setState(() {
            widget.isChose = value['isChose'];
            widget.chose = value['chose'];
          });
        });
      },
    );
  }
}
