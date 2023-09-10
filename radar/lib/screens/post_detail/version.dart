import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:radar/global/colors.dart';
import 'package:radar/global/medium_text.dart';
import 'package:radar/global/regular_text.dart';
import 'package:radar/providers/version_bloc.dart';

import '../../global/bold_text.dart';
import '../../global/dimension.dart';
import '../../global/scroll_things_provider.dart';

class Version extends StatefulWidget {
  VersionBloc bloc;
  int index;
  Version({super.key, required this.bloc, required this.index});

  @override
  State<Version> createState() => _VersionState();
}

class _VersionState extends State<Version> with AutomaticKeepAliveClientMixin {
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
                  text: 'Version History',
                ),
                SizedBox(height: Dimensions.height5),
                Divider(),
                SizedBox(height: Dimensions.height5),
                Column(
                  children: List.generate(
                    5,
                    (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BoldText(
                                color: color_title,
                                size: Dimensions.height2 * 8,
                                text: "1.0.0",
                              ),
                              Text(
                                '1y ago',
                                style: TextStyle(
                                  color: color_sub_title,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Dimensions.height2),
                          ExpandableText(
                            '修改了綽號："中原小辣椒" ,修改了綽號："中原小辣椒" ,修改了綽號："中原小辣椒" ,修改了綽號："中原小辣椒" ,修改了綽號："中原小辣椒" ,修改了綽號："中原小辣椒" ,修改了綽號："中原小辣椒" ,修改了綽號："中原小辣椒" ,修改了綽號："中原小辣椒" ,修改了綽號："中原小辣椒" ,修改了綽號："中原小辣椒" ,',
                            expandText: 'more',
                            collapseText: 'show less',
                            linkColor: color_title,
                            maxLines: 5,
                            animation: true,
                            collapseOnTextTap: true,
                            style: TextStyle(
                              color: color_sub_title,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          SizedBox(height: Dimensions.height5 * 2),
                          ExpansionTile(
                            tilePadding: EdgeInsets.all(0),
                            childrenPadding: EdgeInsets.only(
                              bottom: Dimensions.height5 * 2,
                            ),
                            trailing: Icon(
                              Icons.arrow_drop_down_sharp,
                              color: color_man,
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MediumText(
                                  color: color_man,
                                  size: Dimensions.height2*7,
                                  text: "修改人留言",
                                ),
                              ],
                            ),
                            children: [
                              MediumText(
                                color: color_title,
                                size: Dimensions.height2*7,
                                maxLines: 20,
                                text:
                                    "我修改了這個因為我修改了這個因為我修改了這個因為我修改了這個因為我修改了這個因為",
                              ),
                            ],
                          ),
                          SizedBox(height: Dimensions.height5),
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
                          SizedBox(height: Dimensions.height5),
                          Divider(),
                        ],
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
