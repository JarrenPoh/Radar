import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:radar/providers/post_detail/version_bloc.dart';
import '../../global/bold_text.dart';
import '../../global/dimension.dart';
import '../../widgets/comment_card.dart';

class Version extends StatefulWidget {
  final VersionBloc bloc;
  const Version({
    super.key,
    required this.bloc,
  });

  @override
  State<Version> createState() => _VersionState();
}

class _VersionState extends State<Version> with AutomaticKeepAliveClientMixin {
  @override
  final bool wantKeepAlive = true;
  Widget build(BuildContext context) {
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
                      maxLines: 2,
                    ),
                    SizedBox(height: Dimensions.height5*3),
                    Padding(
                      padding: EdgeInsets.only(left: Dimensions.width5 * 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BoldText(
                            color: color_title,
                            size: Dimensions.height2 * 7,
                            text: "筆者留言：中原笑辣椒",
                          ),
                          SizedBox(height: Dimensions.height5 * 2),
                          ExpandableText(
                            "我修改這個因為他有一點我不知道怎麼說的",
                            expandText: 'more',
                            collapseText: 'show less',
                            linkColor: color_title,
                            maxLines: 5,
                            animation: true,
                            collapseOnTextTap: true,
                            style: TextStyle(
                              color: color_sub_title,
                              overflow: TextOverflow.fade,
                              fontSize: Dimensions.height2 * 7.25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Dimensions.height5 * 2),
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
