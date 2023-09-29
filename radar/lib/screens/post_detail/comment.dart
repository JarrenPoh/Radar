import 'package:flutter/material.dart';
import 'package:radar/global/bold_text.dart';
import 'package:radar/global/colors.dart';
import 'package:radar/global/medium_text.dart';
import 'package:radar/providers/post_detail/comment_bloc.dart';
import '../../global/dimension.dart';
import '../../widgets/comment_card.dart';

class Comment extends StatefulWidget {
  final CommentBloc bloc;
  const Comment({
    super.key,
    required this.bloc,
  });

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> with AutomaticKeepAliveClientMixin {
  bool overflowed = false;
  String hintText = "新增留言";
  @override
  final bool wantKeepAlive = true;
  FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    widget.bloc.textEditingController.addListener(() {
      if (widget.bloc.textEditingController.text.trim().isEmpty) {
        widget.bloc.isCommentProvider.boolChange(false);
      } else {
        widget.bloc.isCommentProvider.boolChange(true);
      }
    });
  }

  openKeyBoard() {
    FocusScope.of(context).requestFocus(_focusNode);
    hintText = '回覆 中原小辣椒';
  }

  closeKeyBoard() {
    FocusScope.of(context).unfocus();
    hintText = '新增評論';
  }

  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    Color color_title = Theme.of(context).colorScheme.primary;
    Color color_sub_title = Theme.of(context).colorScheme.secondary;
    Color color_container = Theme.of(context).colorScheme.primaryContainer;
    super.build(context);

    return SafeArea(
      bottom: true,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => closeKeyBoard(),
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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width5 * 5,
                vertical: Dimensions.height5 * 1,
              ),
              child: BoldText(
                color: color_title,
                size: Dimensions.height5 * 6,
                text: 'Comment',
              ),
            ),
            SizedBox(height: Dimensions.height5),
            Divider(),
            SizedBox(height: Dimensions.height5),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width5 * 5,
                  vertical: Dimensions.height5 * 1,
                ),
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    String text =
                        "小辣椒中原中原小椒中原小辣椒中原小辣椒中原小辣辣椒中原中原小椒中原小辣椒中原中原小椒中原小辣椒中原小辣椒中原小辣辣椒中原中原小椒中原小辣椒中原中原小椒中原小辣椒中原小辣椒中原小辣辣椒中原中原小椒中原小辣椒中原中原小椒中原小辣椒中原小辣椒中原小辣辣椒中原中原小椒中原小辣椒中原小辣椒中原小辣辣椒中原中原小椒中原小辣椒中原小辣椒中原小辣椒中原小辣椒中原小辣椒中原小辣椒中原小辣椒中原小辣椒中原小椒中原小辣椒中原小辣椒中原小辣椒中原小辣椒中原小辣椒";
                    return Container(
                      padding: EdgeInsets.all(Dimensions.height5 * 4),
                      margin: EdgeInsets.symmetric(
                          vertical: Dimensions.height5 * 2),
                      width: Dimensions.screenWidth,
                      decoration: BoxDecoration(
                        color: color_container,
                        borderRadius:
                            BorderRadius.circular(Dimensions.height5 * 2),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommentCard(
                            contentColor: color_title,
                            contentText: text,
                            titleColor: color_sub_title,
                            titleText: '中原笑辣椒',
                            maxLines: 5,
                          ),
                          GestureDetector(
                            onTap: openKeyBoard,
                            child: MediumText(
                              color: color_sub_title,
                              size: Dimensions.height2 * 7,
                              text: '回覆',
                            ),
                          ),
                          Divider(),
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
                                padding: EdgeInsets.only(
                                    left: Dimensions.width5 * 3),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommentCard(
                                      contentColor: color_title,
                                      contentText: text,
                                      titleColor: color_sub_title,
                                      titleText: '中原笑辣椒',
                                      maxLines: 5,
                                    ),
                                    GestureDetector(
                                      onTap: openKeyBoard,
                                      child: MediumText(
                                        color: color_sub_title,
                                        size: Dimensions.height2 * 7,
                                        text: '回覆',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: Dimensions.height5),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: Dimensions.height5 * 10,
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width5 * 5,
                        vertical: Dimensions.height5 * 1,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextField(
                              focusNode: _focusNode,
                              controller: widget.bloc.textEditingController,
                              style: TextStyle(color: color_title),
                              keyboardType: TextInputType.multiline,
                              maxLines: 20,
                              decoration: InputDecoration(
                                // errorText: emptyEnter ? '不可為空' : null,
                                errorStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                                hintText: hintText,
                                border: inputBorder,
                                focusedBorder: inputBorder,
                                enabledBorder: inputBorder,
                                filled: false,
                                contentPadding: const EdgeInsets.all(10),
                              ),
                            ),
                          ),
                          ValueListenableBuilder(
                            valueListenable: widget.bloc.isCommentProvider,
                            builder: ((context, value, child) {
                              value as bool;
                              return value == true
                                  ? InkWell(
                                      onTap: () async {},
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: Dimensions.width2 * 8),
                                        child: Text(
                                          '發送',
                                          style: TextStyle(
                                            color: color_man,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container();
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
