import 'package:flutter/material.dart';

import '../../global/colors.dart';
import '../../global/dimension.dart';
import '../../widgets/rate_row.dart';

class DetailNavigationBar extends StatefulWidget {
  bool isMan;
  Widget makeDismissible;
  DetailNavigationBar({
    super.key,
    required this.isMan,
    required this.makeDismissible,
  });

  @override
  State<DetailNavigationBar> createState() => _DetailNavigationBarState();
}

class _DetailNavigationBarState extends State<DetailNavigationBar> {
  @override
  Widget build(BuildContext context) {
    Color _color_vote = widget.isMan ? color_man : color_woman;
    Color color_onPrimary = Theme.of(context).colorScheme.onPrimary;
    Color color_onSecondary = Theme.of(context).colorScheme.onSecondary;
    Color color_title = Theme.of(context).colorScheme.primary;
    Color color_sub_title = Theme.of(context).colorScheme.secondary;
    Color _color_arrow = widget.isMan ? color_man_opacity : color_woman_opacity;
    Color color_container = Theme.of(context).colorScheme.primaryContainer;

    return Container(
      padding: EdgeInsets.only(
        top: Dimensions.height5 * 2,
        left: Dimensions.width5 * 3,
        right: Dimensions.width5 * 3,
      ),
      decoration: BoxDecoration(
        color: color_onPrimary,
        border: Border(
          top: BorderSide(color: color_container),
        ),
      ),
      height: Dimensions.height5 * 18,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: Dimensions.height5 * 1),
            child: RateRow(
              iconPadding: Dimensions.width5 * 2,
              iconSize: Dimensions.height5 * 7,
              isMan: true,
              numberSize: Dimensions.height5 * 5,
            ),
          ),
          Expanded(child: Column(children: [])),
          Row(
            children: [
              SizedBox(
                width: Dimensions.width5 * 7.5,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_outline_rounded,
                    color: color_onSecondary,
                    size: Dimensions.height5 * 5,
                  ),
                ),
              ),
              Text('2.3k', style: TextStyle(color: color_title)),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: Dimensions.width5 * 7.5,
                child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      // backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => widget.makeDismissible,
                    );
                  },
                  icon: Icon(
                    Icons.messenger_outline_rounded,
                    color: color_onSecondary,
                    size: Dimensions.height5 * 5,
                  ),
                ),
              ),
              Text('2.3k', style: TextStyle(color: color_title)),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: Dimensions.width5 * 7.5,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send_rounded,
                    color: color_onSecondary,
                    size: Dimensions.height5 * 5,
                  ),
                ),
              ),
              Text('2.3k', style: TextStyle(color: color_title)),
            ],
          ),
        ],
      ),
    );
  }
}
