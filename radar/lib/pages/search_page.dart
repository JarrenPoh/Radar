import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radar/global/colors.dart';
import 'package:radar/global/dimension.dart';
import 'package:radar/global/scroll_things_provider.dart';
import 'package:radar/providers/post_list/post_list_bloc.dart';
import 'package:radar/providers/search_page/search_page_bloc.dart';
import 'package:radar/providers/user_list_bloc.dart';
import 'package:radar/screens/post_list/post_list.dart';
import 'package:radar/screens/user_list.dart';
import 'package:radar/widgets/custom/custom_search_bar.dart';
import 'package:radar/widgets/search_history.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  final bool wantKeepAlive = true;
  final SearchPageBloc _searchPageBloc = SearchPageBloc();
  @override
  void initState() {
    super.initState();
    _searchPageBloc.tabController = TabController(
      length: _searchPageBloc.tabList.length,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    Color color_onPrimary = Theme.of(context).colorScheme.onPrimary;
    Color color_onSecondary = Theme.of(context).colorScheme.onSecondary;
    Color color_title = Theme.of(context).colorScheme.primary;
    Color color_sub_title = Theme.of(context).colorScheme.secondary;
    Color color_scaffold = Theme.of(context).colorScheme.background;
    Color color_container = Theme.of(context).colorScheme.primaryContainer;
    List<Widget> widgets = [
      Consumer<PostListBloc>(builder: (context, value, child) {
        if (value.isSearch) {
          return PostList(
            bloc: _searchPageBloc.postListBloc,
            index: 0,
          );
        } else {
          return SearchHistory(
            bloc: _searchPageBloc.historyPostBloc,
            index: 0,
          );
        }
      }),
      Consumer<UserListBloc>(builder: (context, value, child) {
        if (value.isSearch) {
          return UserList(
            bloc: _searchPageBloc.userListBloc,
            index: 1,
          );
        } else {
          return SearchHistory(
            bloc: _searchPageBloc.historyUserBloc,
            index: 1,
          );
        }
      }),
    ];

    return Scaffold(
      backgroundColor: color_scaffold,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: false,
                floating: true,
                title: Consumer<SearchPageBloc>(
                  builder: (context, value, child) {
                    value.isPost;
                    return CustomSearchBar(
                      textEditingController: value.isPost
                          ? _searchPageBloc.postListBloc.textEditingController
                          : _searchPageBloc.userListBloc.textEditingController,
                      onSubmitted: () {
                        value.isPost
                            ? Provider.of<PostListBloc>(context, listen: false)
                                .isSearchChange(true)
                            : Provider.of<UserListBloc>(context, listen: false)
                                .isSearchChange(true);
                      },
                      cancel: () {
                        value.isPost
                            ? Provider.of<PostListBloc>(context, listen: false)
                                .isSearchChange(false)
                            : Provider.of<UserListBloc>(context, listen: false)
                                .isSearchChange(false);
                      },
                    );
                  },
                ),
                bottom: TabBar(
                  overlayColor: null,
                  labelColor: color_title,
                  labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                  unselectedLabelColor: color_sub_title,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    color: color_woman,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  indicatorPadding: EdgeInsets.only(
                    bottom: Dimensions.height2 * 4,
                    top: Dimensions.height2 * 18.5,
                    left: Dimensions.width5 * 1,
                    right: Dimensions.width5 * 1,
                  ),
                  indicatorWeight: 4,
                  onTap: (value) {
                    _searchPageBloc.tabController.index = value;
                    Provider.of<SearchPageBloc>(context, listen: false)
                        .isPostChange(value == 0 ? true : false);
                  },
                  controller: _searchPageBloc.tabController,
                  tabs: List.generate(
                    _searchPageBloc.tabList.length,
                    (index) => Tab(child: Text(_searchPageBloc.tabList[index])),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Builder(
          builder: (context) {
            return CustomScrollProvider(
              tabController: _searchPageBloc.tabController,
              parent: PrimaryScrollController.of(context),
              child: TabBarView(
                controller: _searchPageBloc.tabController,
                children: List.generate(
                  _searchPageBloc.tabList.length,
                  (index) {
                    return widgets[index];
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
