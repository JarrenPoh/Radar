import 'package:flutter/material.dart';
import 'package:radar/global/bold_text.dart';
import 'package:radar/global/colors.dart';
import 'package:radar/global/dimension.dart';
import 'package:radar/global/medium_text.dart';
import 'package:radar/global/regular_text.dart';
import 'package:radar/providers/information_bloc.dart';
import 'package:radar/widgets/rate_row.dart';

import '../../global/scroll_things_provider.dart';

class Information extends StatefulWidget {
  InformationBloc bloc;
  int index;
  Information({super.key, required this.bloc, required this.index});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information>
    with AutomaticKeepAliveClientMixin {
  @override
  final bool wantKeepAlive = true;
  Widget build(BuildContext context) {
    Color color_onPrimary = Theme.of(context).colorScheme.onPrimary;
    Color color_onSecondary = Theme.of(context).colorScheme.onSecondary;
    Color color_title = Theme.of(context).colorScheme.primary;
    Color color_sub_title = Theme.of(context).colorScheme.secondary;
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
                  text: 'Information',
                ),
                SizedBox(height: Dimensions.height5),
                Divider(),
                SizedBox(height: Dimensions.height5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MediumText(
                      color: color_title,
                      size: Dimensions.height2 * 10,
                      text: '中原金剛芭比',
                    ),
                    BoldText(
                      color: color_woman,
                      size: Dimensions.height2 * 7,
                      text: '單身中',
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                Column(
                  children: List.generate(
                    widget.bloc.informations.length,
                    (index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RegularText(
                              color: color_sub_title,
                              size: 16,
                              text: "${widget.bloc.informations[index]}：",
                            ),
                            Container(
                              width: Dimensions.screenWidth / 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  RegularText(
                                    color: color_title,
                                    size: 16,
                                    maxLines: 20,
                                    text: "${widget.bloc.informations[index]}",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Divider(),
                        SizedBox(height: 8),
                      ],
                    ),
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
