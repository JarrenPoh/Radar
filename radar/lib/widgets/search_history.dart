import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radar/global/colors.dart';
import 'package:radar/global/dimension.dart';
import 'package:radar/global/medium_text.dart';
import 'package:radar/providers/search_page/search_history_bloc.dart';
import '../../global/scroll_things_provider.dart';

class SearchHistory extends StatefulWidget {
  final SearchHistoryBloc bloc;
  final int index;
  const SearchHistory({
    super.key,
    required this.bloc,
    required this.index,
  });

  @override
  State<SearchHistory> createState() => _SearchHistoryState();
}

class _SearchHistoryState extends State<SearchHistory>
    with AutomaticKeepAliveClientMixin {
  @override
  final bool wantKeepAlive = true;

  Widget build(BuildContext context) {
    super.build(context);
    final scrollProvider = CustomScrollProviderData.of(context);
    widget.bloc.scrollController =
        scrollProvider.scrollControllers[widget.index];
    Color color_title = Theme.of(context).colorScheme.primary;
    Color color_sub_title = Theme.of(context).colorScheme.secondary;

    return CustomScrollView(
      controller: widget.bloc.scrollController,
      slivers: [
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverPadding(
          padding:
              EdgeInsets.symmetric(horizontal: Dimensions.width2, vertical: 0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: widget.bloc.historyList.length,
              (context, index) {
                return GestureDetector(
                  onTap: () {
                    print('tap');
                    // Navigator.of(context).push(
                    //   isIOS
                    //       ? platformPageRoute(
                    //           context: context,
                    //           builder: (context) => ProfileScreen(
                    //             searchUserUid: widget.searchSearchHistory[index].uid,
                    //             hiddenDrawer: false,
                    //           ),
                    //         )
                    //       : CustomPageRoute(
                    //           child: ProfileScreen(
                    //             searchUserUid: widget.searchSearchHistory[index].uid,
                    //             hiddenDrawer: false,
                    //           ),
                    //         ),
                    // );
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.history,
                      color: color_sub_title,
                      size: Dimensions.height2 * 13,
                    ),
                    title: MediumText(
                      color: color_title,
                      size: Dimensions.height2 * 8,
                      text: widget.bloc.historyList[index],
                    ),
                    subtitle: MediumText(
                      color: color_sub_title,
                      size: Dimensions.height2 * 7,
                      text:
                          widget.bloc.historyList[index].toString().replaceAll(
                                RegExp(r"\s+\b|\b\s|\s+"),
                                "",
                              ),
                      maxLines: 1,
                    ),
                    trailing: CupertinoButton(
                      child: Icon(
                        CupertinoIcons.clear_circled,
                        color: color_sub_title,
                        size: Dimensions.height2 * 10,
                      ),
                      onPressed: () {},
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
