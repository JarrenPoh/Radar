import 'package:flutter/material.dart';

import '../global/colors.dart';

class RateRow extends StatefulWidget {
  double iconSize;
  double iconPadding;
  double numberSize;
  bool isMan;
  RateRow({
    super.key,
    required this.iconPadding,
    required this.iconSize,
    required this.isMan,
    required this.numberSize,
  });

  @override
  State<RateRow> createState() => _RateRowState();
}

class _RateRowState extends State<RateRow> {
  @override
  Widget build(BuildContext context) {
    Color _color_arrow = widget.isMan ? color_man_opacity : color_woman_opacity;
    Color _color_vote = widget.isMan ? color_man : color_woman;
    Color color_onPrimary = Theme.of(context).colorScheme.onPrimary;
    Color color_onSecondary = Theme.of(context).colorScheme.onSecondary;
    Color color_title = Theme.of(context).colorScheme.primary;
    Color color_sub_title = Theme.of(context).colorScheme.secondary;
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: _color_arrow,
            borderRadius: BorderRadius.circular(widget.iconSize / 2),
          ),
          child: Icon(
            Icons.arrow_downward,
            size: widget.iconSize,
            color: color_onPrimary,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: widget.iconPadding,
          ),
          child: Text(
            '342',
            style: TextStyle(
              fontSize: widget.numberSize,
              fontWeight: FontWeight.bold,
              color: _color_vote,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: _color_arrow,
            borderRadius: BorderRadius.circular(widget.iconSize / 2),
          ),
          child: Icon(
            Icons.arrow_upward,
            size: widget.iconSize,
            color: color_onPrimary,
          ),
        ),
      ],
    );
  }
}
