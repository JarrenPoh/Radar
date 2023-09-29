import 'package:flutter/material.dart';
import 'package:radar/global/colors.dart';
import 'package:radar/global/dimension.dart';
import 'package:radar/global/regular_text.dart';

// ignore: must_be_immutable
class EditRadio extends StatefulWidget {
  int groupValue;
  String firstRadio;
  String secondRadio;
  EditRadio({
    super.key,
    required this.groupValue,
    required this.firstRadio,
    required this.secondRadio,
  });

  @override
  State<EditRadio> createState() => _EditRadioState();
}

class _EditRadioState extends State<EditRadio> {
  @override
  Widget build(BuildContext context) {
    Color color_title = Theme.of(context).colorScheme.primary;

    return Padding(
      padding: EdgeInsets.only(top: Dimensions.height5 * 3),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: 0,
                groupValue: widget.groupValue,
                activeColor: color_man,
                onChanged: (value) {
                  setState(() {
                    widget.groupValue = 0;
                  });
                },
              ),
              RegularText(
                color: color_title,
                size: Dimensions.height2 * 8,
                text: widget.firstRadio,
              ),
              Radio(
                value: 1,
                groupValue: widget.groupValue,
                activeColor: color_woman,
                onChanged: (value) {
                  setState(() {
                    widget.groupValue = 1;
                  });
                },
              ),
              RegularText(
                color: color_title,
                size: Dimensions.height2 * 8,
                text: widget.secondRadio,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
