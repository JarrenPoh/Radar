import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

import '../global/bold_text.dart';
import '../global/dimension.dart';
import '../global/medium_text.dart';

class CommentCard extends StatefulWidget {
  Color titleColor;
  Color contentColor;
  String titleText;
  String contentText;
  CommentCard({
    super.key,
    required this.contentColor,
    required this.contentText,
    required this.titleColor,
    required this.titleText,
  });

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    // Color color_onPrimary = Theme.of(context).colorScheme.onPrimary;
    // Color color_onSecondary = Theme.of(context).colorScheme.onSecondary;
    Color color_title = Theme.of(context).colorScheme.primary;
    Color color_sub_title = Theme.of(context).colorScheme.secondary;
    // Color color_container = Theme.of(context).colorScheme.primaryContainer;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BoldText(
              color: widget.titleColor,
              size: Dimensions.height5 * 3,
              text: widget.titleText,
            ),
            SizedBox(width: Dimensions.width5 * 1.5),
            Text(
              '1y ago',
              style: TextStyle(
                color: color_sub_title,
              ),
            ),
            Expanded(child: Column(children: [])),
            Icon(
              Icons.favorite_border_rounded,
              color: color_sub_title,
              size: Dimensions.height2 * 9,
            ),
          ],
        ),
        SizedBox(height: Dimensions.height5),
        ExpandableText(
          widget.contentText,
          expandText: 'more',
          collapseText: 'show less',
          linkColor: widget.titleColor,
          maxLines: 5,
          animation: true,
          collapseOnTextTap: true,
          style: TextStyle(
            color: widget.contentColor,
            overflow: TextOverflow.fade,
          ),
        ),
        SizedBox(height: Dimensions.height5 * 2),
      ],
    );
  }
}
