import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:radar/global/bold_text.dart';
import 'package:radar/global/colors.dart';
import 'package:radar/global/medium_text.dart';
import 'package:radar/global/regular_text.dart';
import 'package:radar/providers/comment_bloc.dart';
import '../../global/dimension.dart';
import '../../global/scroll_things_provider.dart';

class Comment extends StatefulWidget {
  CommentBloc bloc;
  int index;
  Comment({super.key, required this.bloc, required this.index});

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> with AutomaticKeepAliveClientMixin {
  bool overflowed = false;
  @override
  final bool wantKeepAlive = true;

  Widget build(BuildContext context) {
    Color color_onPrimary = Theme.of(context).colorScheme.onPrimary;
    Color color_onSecondary = Theme.of(context).colorScheme.onSecondary;
    Color color_title = Theme.of(context).colorScheme.primary;
    Color color_sub_title = Theme.of(context).colorScheme.secondary;
    Color color_container = Theme.of(context).colorScheme.primaryContainer;
    super.build(context);

    final scrollProvider = CustomScrollProviderData.of(context);
    widget.bloc.scrollController =
        scrollProvider.scrollControllers[widget.index];

    return CustomScrollView(
      controller: widget.bloc.scrollController,
      slivers: [
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width5 * 5,
            vertical: Dimensions.height5 * 1,
          ),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoldText(
                  color: color_title,
                  size: Dimensions.height5 * 6,
                  text: 'Comment',
                ),
                SizedBox(height: Dimensions.height5),
                Divider(),
                SizedBox(height: Dimensions.height5),
                Column(
                  children: List.generate(
                    5,
                    (index) {
                      String text =
                          "小辣椒中原中原小椒中原小辣椒中原小辣椒中原小辣辣椒中原中原小椒中原小辣椒中原中原小椒中原小辣椒中原小辣椒中原小辣辣椒中原中原小椒中原小辣椒中原中原小椒中原小辣椒中原小辣椒中原小辣辣椒中原中原小椒中原小辣椒中原中原小椒中原小辣椒中原小辣椒中原小辣辣椒中原中原小椒中原小辣椒中原小辣椒中原小辣辣椒中原中原小椒中原小辣椒中原小辣椒中原小辣椒中原小辣椒中原小辣椒中原小辣椒中原小辣椒中原小辣椒中原小椒中原小辣椒中原小辣椒中原小辣椒中原小辣椒中原小辣椒";
                      var tp = TextPainter(
                        maxLines: 4,
                        textAlign: TextAlign.start,
                        textDirection: TextDirection.ltr,
                        text: TextSpan(text: text),
                      );
                      return Container(
                        padding: EdgeInsets.all(Dimensions.height5 * 4),
                        margin: EdgeInsets.symmetric(
                            vertical: Dimensions.height5 * 2),
                        width: Dimensions.screenWidth,
                        decoration: BoxDecoration(
                          color: color_container,
                          borderRadius:
                              BorderRadius.circular(Dimensions.height5 * 2),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BoldText(
                                  color: color_title,
                                  size: Dimensions.height5 * 3,
                                  text: '中原小辣椒',
                                ),
                                Text(
                                  '1y ago',
                                  style: TextStyle(
                                    color: color_sub_title,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Dimensions.height5),
                            ExpandableText(
                              text,
                              expandText: 'more',
                              collapseText: 'show less',
                              linkColor: color_sub_title,
                              maxLines: 5,
                              animation: true,
                              collapseOnTextTap: true,
                              style: TextStyle(
                                color: color_title,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            SizedBox(height: Dimensions.height5 * 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.thumb_down_off_alt_outlined,
                                  color: Color.fromARGB(255, 234, 202, 139),
                                  size: Dimensions.height2 * 11,
                                ),
                                SizedBox(width: Dimensions.width5 * 2),
                                Icon(
                                  Icons.thumb_up_alt_outlined,
                                  color: Color.fromARGB(255, 234, 202, 139),
                                  size: Dimensions.height2 * 11,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
