import 'package:flutter/material.dart';
import 'package:radar/global/bold_text.dart';
import 'package:radar/global/colors.dart';
import 'package:radar/global/dimension.dart';
import 'package:radar/global/medium_text.dart';
import 'package:radar/providers/post_detail/information_bloc.dart';

class Information extends StatefulWidget {
  final InformationBloc bloc;
  const Information({
    super.key,
    required this.bloc,
  });

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information>
    with AutomaticKeepAliveClientMixin {
  @override
  final bool wantKeepAlive = true;
  Widget build(BuildContext context) {
    Color color_title = Theme.of(context).colorScheme.primary;
    Color color_sub_title = Theme.of(context).colorScheme.secondary;
    super.build(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.width5 * 5,
        vertical: Dimensions.height5 * 1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Dimensions.height5*3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MediumText(
                color: color_title,
                size: Dimensions.height2 * 10,
                text: '中原金剛芭比',
              ),
              MediumText(
                color: color_woman,
                size: Dimensions.height2 * 7,
                text: '單身中',
              ),
            ],
          ),
          SizedBox(height: Dimensions.height5 * 2),
          Divider(),
          SizedBox(height: Dimensions.height5 * 2),
          BoldText(
            color: color_title,
            size: Dimensions.height5 * 5,
            text: 'Information',
          ),
          SizedBox(height: Dimensions.height5 * 5),
          GridView.custom(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 0, bottom: 0),
            physics: const ClampingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              childAspectRatio: 1.4,
              crossAxisSpacing: Dimensions.width5 * 2,
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SizedBox(
                  height: Dimensions.height5 * 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MediumText(
                            color: color_sub_title,
                            size: Dimensions.height2 * 7.5,
                            text: widget.bloc.informations[index],
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(right: Dimensions.width2 * 3),
                            child: Icon(
                              Icons.create_rounded,
                              color: color_sub_title,
                              size: Dimensions.height2 * 7,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: Dimensions.height2 * 2),
                      MediumText(
                        color: color_title,
                        size: Dimensions.height2 * 8,
                        text: widget.bloc.answers[index],
                        maxLines: 20,
                      ),
                      SizedBox(height: Dimensions.height5),
                    ],
                  ),
                );
              },
              childCount: widget.bloc.answers.length, // 10个网格项
            ),
          ),
          Divider(),
          SizedBox(height: Dimensions.height5 * 2),
          MediumText(
            color: color_sub_title,
            size: Dimensions.height2 * 7.5,
            text: '筆者描述',
          ),
          SizedBox(height: Dimensions.height2 * 2),
          MediumText(
            color: color_title,
            size: Dimensions.height2 * 8,
            text:
                '我第一次看到他的時候我就我第一次看到他的時候我就我第一次看到他的時候我就我第一次看到他的時候我就我第一次看到他的時候我就',
            maxLines: 20,
          ),
          SizedBox(height: Dimensions.height5 * 2),
          Divider(),
          SizedBox(height: Dimensions.height5 * 2),
          MediumText(
            color: color_sub_title,
            size: Dimensions.height2 * 7.5,
            text: '管理員',
          ),
          SizedBox(height: Dimensions.height2 * 2),
          MediumText(
            color: color_title,
            size: Dimensions.height2 * 8,
            text: '木頭人，稻草人',
            maxLines: 20,
          ),
          SizedBox(height: Dimensions.height2 * 2),
        ],
      ),
    );
  }
}
