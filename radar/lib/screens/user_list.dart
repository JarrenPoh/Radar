import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radar/global/colors.dart';
import 'package:radar/global/dimension.dart';
import 'package:radar/global/medium_text.dart';
import 'package:radar/providers/user_list_bloc.dart';
import '../../global/scroll_things_provider.dart';

class UserList extends StatefulWidget {
  final UserListBloc bloc;
  final int index;
  const UserList({
    super.key,
    required this.bloc,
    required this.index,
  });

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList>
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
              childCount: widget.bloc.userList.length,
              (context, index) {
                return GestureDetector(
                  onTap: () {
                    print('tap');
                    // Navigator.of(context).push(
                    //   isIOS
                    //       ? platformPageRoute(
                    //           context: context,
                    //           builder: (context) => ProfileScreen(
                    //             searchUserUid: widget.searchUserList[index].uid,
                    //             hiddenDrawer: false,
                    //           ),
                    //         )
                    //       : CustomPageRoute(
                    //           child: ProfileScreen(
                    //             searchUserUid: widget.searchUserList[index].uid,
                    //             hiddenDrawer: false,
                    //           ),
                    //         ),
                    // );
                  },
                  child: ListTile(
                    title: MediumText(
                      color: color_title,
                      size: Dimensions.height2 * 8,
                      text: widget.bloc.userList[index],
                    ),
                    subtitle: MediumText(
                      color: color_sub_title,
                      size: Dimensions.height2 * 7,
                      text: widget.bloc.bioList[index].toString().replaceAll(
                            RegExp(r"\s+\b|\b\s|\s+"),
                            "",
                          ),
                      maxLines: 1,
                    ),
                    trailing: CupertinoButton(
                      child: MediumText(
                        color: color_man,
                        size: Dimensions.height2 * 8,
                        text: '追蹤',
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
