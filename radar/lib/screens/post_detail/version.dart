import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:radar/global/colors.dart';
import 'package:radar/global/medium_text.dart';
import 'package:radar/global/regular_text.dart';
import 'package:radar/providers/version_bloc.dart';

import '../../global/bold_text.dart';
import '../../global/dimension.dart';
import '../../global/scroll_things_provider.dart';
import '../../widgets/comment_card.dart';

class Version extends StatefulWidget {
  VersionBloc bloc;
  Version({
    super.key,
    required this.bloc,
  });

  @override
  State<Version> createState() => _VersionState();
}

class _VersionState extends State<Version> with AutomaticKeepAliveClientMixin {
  FocusNode _focusNode = FocusNode();
  openKeyBoard() {
    FocusScope.of(context).requestFocus(_focusNode);
  }

  @override
  final bool wantKeepAlive = true;
  Widget build(BuildContext context) {
    Color color_onPrimary = Theme.of(context).colorScheme.onPrimary;
    Color color_onSecondary = Theme.of(context).colorScheme.onSecondary;
    Color color_title = Theme.of(context).colorScheme.primary;
    Color color_sub_title = Theme.of(context).colorScheme.secondary;
    Color color_container = Theme.of(context).colorScheme.primaryContainer;
    super.build(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.width5 * 5,
        vertical: Dimensions.height5 * 1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Dimensions.width5 * 8,
                height: Dimensions.height5 * 1.5,
                decoration: BoxDecoration(
                  color: color_container,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
          SizedBox(height: Dimensions.height5 * 2),
          BoldText(
            color: color_title,
            size: Dimensions.height5 * 6,
            text: 'Version History',
          ),
          SizedBox(height: Dimensions.height5),
          Divider(),
          SizedBox(height: Dimensions.height5),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommentCard(
                      contentColor: color_sub_title,
                      contentText:
                          '修改了綽號："中原小辣椒" ,修改了綽號："中原小辣椒" ,修改了綽號："中原小辣椒" ,修改了綽號："中原小辣椒" ,修改了綽號："中原小辣椒" ,修改了綽號："中原小辣椒" ,修改了綽號："中原小辣椒" ,修改了綽號："中原小辣椒" ,修改了綽號："中原小辣椒" ,修改了綽號："中原小辣椒" ,修改了綽號："中原小辣椒" ,',
                      titleColor: color_title,
                      titleText: '1.0.0',
                    ),
                    SizedBox(height: Dimensions.height5),
                    Padding(
                      padding: EdgeInsets.only(left: Dimensions.width5 * 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommentCard(
                            contentColor: color_title,
                            contentText: "我修改這個因為他有一點我不知道怎麼說的",
                            titleColor: color_sub_title,
                            titleText: '筆者：中原笑辣椒',
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: MediumText(
                              color: color_sub_title,
                              size: Dimensions.height2 * 7,
                              text: '回覆',
                            ),
                          ),
                        ],
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
                            size: Dimensions.height2 * 7,
                            text: "其他人留言",
                          ),
                          SizedBox(width: Dimensions.width5 * 1.5),
                          Text(
                            '(132)',
                            style: TextStyle(
                              color: color_man,
                              fontSize: Dimensions.height2 * 7,
                            ),
                          )
                        ],
                      ),
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: Dimensions.width5 * 3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommentCard(
                                contentColor: color_title,
                                contentText: '我覺得不錯',
                                titleColor: color_sub_title,
                                titleText: '中原笑辣椒',
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: MediumText(
                                  color: color_sub_title,
                                  size: Dimensions.height2 * 7,
                                  text: '回覆',
                                ),
                              ),
                            ],
                          ),
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
    );
  }
}
