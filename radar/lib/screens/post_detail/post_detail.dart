import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as model;
import 'package:provider/provider.dart';
import 'package:radar/global/bold_text.dart';
import 'package:radar/global/colors.dart';
import 'package:radar/global/medium_text.dart';
import 'package:radar/global/regular_text.dart';
import 'package:radar/global/scroll_things_provider.dart';
import 'package:radar/providers/post_detail_bloc.dart';
import 'package:radar/screens/post_detail/comment.dart';
import 'package:radar/screens/post_detail/information.dart';
import 'package:radar/screens/post_detail/version.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../global/dimension.dart';
import 'package:radar/providers/information_bloc.dart';

import '../../widgets/rate_row.dart';
import 'detail_navigation_bar.dart';

class PostDetail extends StatefulWidget {
  String heroTag;
  bool isMan;
  List imgUrl;
  PostDetail({
    super.key,
    required this.heroTag,
    required this.isMan,
    required this.imgUrl,
  });

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> with TickerProviderStateMixin {
  final PostDetailBloc _bloc = PostDetailBloc();
  int _page = 1;
  @override
  void initState() {
    super.initState();
    print('init');
    _bloc.tabController = TabController(
      length: _bloc.tabList.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    Color _color_vote = widget.isMan ? color_man : color_woman;
    Color color_onPrimary = Theme.of(context).colorScheme.onPrimary;
    Color color_onSecondary = Theme.of(context).colorScheme.onSecondary;
    Color color_title = Theme.of(context).colorScheme.primary;
    Color color_sub_title = Theme.of(context).colorScheme.secondary;
    Color _color_arrow = widget.isMan ? color_man_opacity : color_woman_opacity;
    Color color_container = Theme.of(context).colorScheme.primaryContainer;

    return Scaffold(
      bottomNavigationBar: DetailNavigationBar(
        isMan: true,
        makeDismissible: makeDismissible(
          color_onPrimary,
          Comment(
            bloc: _bloc.commentBloc,
          ),
        ),
      ),
      body: Container(
        color: color_onPrimary,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: Dimensions.height5 * 140,
                    child: Hero(
                      transitionOnUserGestures: true,
                      tag: widget.heroTag,
                      child: Image.network(
                        widget.imgUrl[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Information(
                    bloc: _bloc.informationBloc,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height5 * 10,
                left: Dimensions.width5 * 2,
                right: Dimensions.width5 * 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    iconSize: Dimensions.height5 * 7,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Container(
                      width: Dimensions.height5 * 8,
                      height: Dimensions.height5 * 8,
                      decoration: BoxDecoration(
                        color: color_onPrimary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.chevron_left,
                        color: color_onSecondary,
                      ),
                    ),
                  ),
                  IconButton(
                    iconSize: Dimensions.height5 * 7,
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        // backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) => makeDismissible(
                          color_onPrimary,
                          Version(
                            bloc: _bloc.versionBloc,
                          ),
                        ),
                      );
                    },
                    icon: Container(
                      width: Dimensions.height5 * 8,
                      height: Dimensions.height5 * 8,
                      decoration: BoxDecoration(
                        color: color_onPrimary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.info_outline_rounded,
                        color: color_onSecondary,
                        size: Dimensions.height2 * 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeDismissible(color_onPrimary, child) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.85,
        minChildSize: 0.4,
        maxChildSize: 1,
        builder: (BuildContext context, ScrollController scrollController) =>
            Container(
          decoration: BoxDecoration(
            color: color_onPrimary,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          padding: EdgeInsets.all(Dimensions.width2 * 3),
          child: child,
        ),
      ),
    );
  }
}
