import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radar/global/dimension.dart';
import 'package:radar/screens/post_list/post_list.dart';
import '../global/colors.dart';
import '../global/scroll_things_provider.dart';
import '../providers/home_page/home_page_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  final bool wantKeepAlive = true;
  final HomePageBloc _homePageBloc = HomePageBloc();

  @override
  void initState() {
    super.initState();
    _homePageBloc.tabController = TabController(
      length: _homePageBloc.tabList.length,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Color color_scaffold = Theme.of(context).colorScheme.background;
    Color color_appBar = Theme.of(context).appBarTheme.backgroundColor!;
    Color color_title = Theme.of(context).colorScheme.primary;
    Color color_sub_title = Theme.of(context).colorScheme.secondary;

    return Scaffold(
      backgroundColor: color_scaffold,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                backgroundColor: color_appBar,
                expandedHeight: Dimensions.height5 * 6,
                forceElevated: innerBoxIsScrolled,
                pinned: true,
                floating: true,
                elevation: 0,
                bottom: TabBar(
                  overlayColor: null,
                  labelColor: color_title,
                  labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                  unselectedLabelColor: color_sub_title,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: color_woman,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  indicatorPadding: EdgeInsets.only(
                    bottom: 8,
                    top: 37,
                    left: Dimensions.width5 * 17,
                    right: Dimensions.width5 * 17,
                  ),
                  onTap: (value) {
                    _homePageBloc.tabController.index = value;
                  },
                  controller: _homePageBloc.tabController,
                  tabs: List.generate(
                    _homePageBloc.tabList.length,
                    (index) => Tab(child: Text(_homePageBloc.tabList[index])),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Builder(builder: (context) {
          return CustomScrollProvider(
            tabController: _homePageBloc.tabController,
            parent: PrimaryScrollController.of(context),
            child: TabBarView(
              controller: _homePageBloc.tabController,
              children: List.generate(
                _homePageBloc.tabList.length,
                (index) => PostList(
                  bloc: _homePageBloc.postListBlocs[index],
                  index: index,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
