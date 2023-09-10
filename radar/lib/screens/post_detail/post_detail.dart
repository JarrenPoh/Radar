import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:radar/global/bold_text.dart';
import 'package:radar/global/colors.dart';
import 'package:radar/global/medium_text.dart';
import 'package:radar/global/regular_text.dart';
import 'package:radar/global/scroll_things_provider.dart';
import 'package:radar/providers/post_detail_bloc.dart';
import 'package:radar/screens/post_detail/comment.dart';
import 'package:radar/screens/post_detail/information.dart';
import 'package:radar/screens/post_detail/version.dart';
import '../../global/dimension.dart';
import 'package:radar/providers/information_bloc.dart';

import '../../widgets/rate_row.dart';

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
    return Scaffold(
      backgroundColor: color_onPrimary,
      body: Hero(
        tag: widget.heroTag,
        child: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  backgroundColor: color_onPrimary,
                  expandedHeight: Dimensions.height5 * 140,
                  pinned: true,
                  stretch: true,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Container(
                      decoration: BoxDecoration(
                        color: color_onPrimary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.chevron_left_outlined,
                        size: Dimensions.height2 * 17,
                        color: color_onSecondary,
                      ),
                    ),
                  ),
                  bottom: TabBar(
                    overlayColor: null,
                    labelColor: color_title,
                    labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                    unselectedLabelColor: color_sub_title,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color: color_woman,
                      borderRadius:
                          BorderRadius.circular(Dimensions.height5 * 4),
                    ),
                    indicatorPadding: EdgeInsets.only(
                      top: 37,
                      bottom: 8,
                      left: Dimensions.width2 * 21,
                      right: Dimensions.width2 * 21,
                    ),
                    onTap: (value) {
                      _bloc.tabController.index = value;
                    },
                    controller: _bloc.tabController,
                    tabs: List.generate(
                      _bloc.tabList.length,
                      (index) => Tab(
                        child: Text(
                          _bloc.tabList[index],
                        ),
                      ),
                    ),
                  ),
                  flexibleSpace: LayoutBuilder(
                    builder: ((context, constraints) {
                      var top = constraints.biggest.height;
                      return Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          FlexibleSpaceBar(
                            // collapseMode: CollapseMode.pin,
                            stretchModes: const <StretchMode>[
                              StretchMode.blurBackground
                            ],
                            background: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                PageView.builder(
                                  onPageChanged: (value) {
                                    setState(() {
                                      _page = value + 1;
                                    });
                                  },
                                  itemCount: widget.imgUrl.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              widget.imgUrl[index]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: Dimensions.width5 * 4,
                                    vertical: Dimensions.height5 * 12,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: Dimensions.height2 * 4,
                                    horizontal: Dimensions.width5 * 4,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 92, 92, 92)
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.height5 * 2)),
                                  child: RegularText(
                                    color: Color.fromARGB(255, 235, 235, 235),
                                    size: Dimensions.height2 * 7,
                                    text: "$_page/${widget.imgUrl.length}",
                                  ),
                                ),
                              ],
                            ),
                            title: AnimatedOpacity(
                              opacity:
                                  top <= Dimensions.height2 * 76 ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 1),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: Dimensions.height2 * 4,
                                    ),
                                    child: Center(
                                      child: MediumText(
                                        color: color_title,
                                        size: Dimensions.height2 * 8,
                                        text: 'this is text',
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: Dimensions.width5 * 5,
                                    top: Dimensions.height5 * 12.5,
                                    child: Text(
                                      '342',
                                      style: TextStyle(
                                        fontSize: Dimensions.height2 * 9,
                                        fontWeight: FontWeight.bold,
                                        color: _color_vote,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              AnimatedOpacity(
                                opacity:
                                    top <= Dimensions.height2 * 76 ? 0.0 : 1.0,
                                duration: const Duration(milliseconds: 1),
                                child: ClipRect(
                                  child: BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                    child: Container(
                                      width: Dimensions.width2 * 60,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      margin: EdgeInsets.symmetric(
                                        horizontal: Dimensions.width5 * 4,
                                        vertical: Dimensions.height5 * 2,
                                      ),
                                      child: RateRow(
                                        iconPadding: Dimensions.width5 * 2,
                                        iconSize: Dimensions.height2 * 12,
                                        isMan: false,
                                        numberSize: Dimensions.height2 * 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: Dimensions.screenWidth,
                                height: Dimensions.height5 * 12,
                                padding: EdgeInsets.only(
                                  top: Dimensions.height5 * 1.5,
                                ),
                                decoration: BoxDecoration(
                                  color: color_onPrimary,
                                  borderRadius: BorderRadius.vertical(
                                    top:
                                        Radius.circular(Dimensions.height5 * 6),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: Dimensions.width5 * 9,
                                      height: Dimensions.width2 * 3.5,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[350],
                                        borderRadius: BorderRadius.circular(
                                          Dimensions.height5 * 4,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              )
            ];
          },
          body: Builder(
            builder: (context) {
              return CustomScrollProvider(
                tabController: _bloc.tabController,
                parent: PrimaryScrollController.of(context),
                child: TabBarView(
                  controller: _bloc.tabController,
                  children: [
                    Information(
                      bloc: _bloc.informationBloc,
                      index: 0,
                    ),
                    Comment(
                      bloc: _bloc.commentBloc,
                      index: 1,
                    ),
                    Version(
                      bloc: _bloc.versionBloc,
                      index: 2,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
