import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:radar/global/colors.dart';
import '../global/bold_text.dart';
import '../global/dimension.dart';

class CommentCard extends StatefulWidget {
  final Color titleColor;
  final Color contentColor;
  final String titleText;
  final String contentText;
  final int maxLines;
  const CommentCard({
    super.key,
    required this.contentColor,
    required this.contentText,
    required this.titleColor,
    required this.titleText,
    required this.maxLines,
  });

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  bool isLike = false;
  @override
  void initState() {
    super.initState();
  }

  tapLike() {
    setState(() {
      isLike = !isLike;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color color_sub_title = Theme.of(context).colorScheme.secondary;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onDoubleTap: () => tapLike(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BoldText(
                color: widget.titleColor,
                size: Dimensions.height2 * 7,
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
              GestureDetector(
                onTap: () => tapLike(),
                child: Icon(
                  isLike ? Icons.favorite : Icons.favorite_border_rounded,
                  color: isLike ? color_woman : color_sub_title,
                  size: Dimensions.height2 * 9,
                ),
              ),
            ],
          ),
          SizedBox(height: Dimensions.height5 * 3),
          ExpandableText(
            widget.contentText,
            expandText: 'more',
            collapseText: 'show less',
            linkColor: widget.titleColor,
            maxLines: widget.maxLines,
            animation: true,
            collapseOnTextTap: true,
            style: TextStyle(
              color: widget.contentColor,
              overflow: TextOverflow.fade,
              fontSize: Dimensions.height2 * 7.25,
            ),
          ),
          SizedBox(height: Dimensions.height5 * 2),
        ],
      ),
    );
  }
}
