import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radar/global/bold_text.dart';
import 'package:radar/global/colors.dart';
import 'package:radar/global/dimension.dart';
import 'package:radar/global/medium_text.dart';
import 'package:radar/providers/add_post/add_post_page_bloc.dart';
import 'package:radar/screens/add_post/add_information.dart';
import 'package:radar/screens/add_post/add_other.dart';
import 'package:radar/screens/add_post/add_picture.dart';
import 'package:radar/widgets/custom/custom_dialog.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage>
    with AutomaticKeepAliveClientMixin {
  @override
  final bool wantKeepAlive = true;
  final AddPostPageBloc _bloc = AddPostPageBloc();
  var currPageValue = 0;

  @override
  void initState() {
    super.initState();
    _bloc.pageWidget = [
      AddPicture(bloc: _bloc.addPictureBloc),
      AddInformation(bloc: _bloc.addInfomBloc),
      AddOther(bloc: _bloc.addOtherBloc),
    ];
    _bloc.itemCount = _bloc.pageWidget.length;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Color color_onPrimary = Theme.of(context).colorScheme.onPrimary;
    Color color_title = Theme.of(context).colorScheme.primary;
    Color color_sub_title = Theme.of(context).colorScheme.secondary;
    Color color_container = Theme.of(context).colorScheme.primaryContainer;

    return CupertinoPageScaffold(
      backgroundColor: color_onPrimary,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: color_onPrimary,
        middle: BoldText(
          color: color_title,
          size: Dimensions.height2 * 8,
          text: '發布貼文',
        ), // 中间标题
      ),
      // 页面内容
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width5 * 2,
          vertical: Dimensions.height5 * 2,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _bloc.pageController,
                itemCount: _bloc.itemCount,
                itemBuilder: (context, index) {
                  return _bloc.pageWidget[index];
                },
                onPageChanged: (value) {
                  setState(() {
                    currPageValue = value;
                  });
                },
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(bottom: Dimensions.height5 * 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Dimensions.width5 * 17,
                    child: CupertinoButton(
                      onPressed: () {
                        currPageValue == 0
                            ? null
                            : _bloc.pageController
                                .jumpToPage(currPageValue - 1);
                        FocusScope.of(context).unfocus();
                      },
                      child: Text(
                        currPageValue == 0 ? '' : 'Back',
                        style: TextStyle(
                          color: color_sub_title,
                          fontSize: Dimensions.height5 * 3.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width5 * 17,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          vertical: Dimensions.height2 * 2),
                      decoration: BoxDecoration(
                        color: color_container,
                        borderRadius: BorderRadius.circular(Dimensions.height5),
                      ),
                      child: MediumText(
                        color: color_title,
                        size: Dimensions.height5 * 3,
                        text: '已完成${currPageValue + 1}/${_bloc.itemCount}',
                      ),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: currPageValue + 1 == 1
                        ? _bloc.addPictureBloc.addPictureNotifier
                        : currPageValue + 1 == 2
                            ? _bloc.addInfomBloc.addInformNotifier
                            : _bloc.addOtherBloc.addOtherNotifier,
                    builder: (context, value, child) {
                      value as bool;
                      return SizedBox(
                        width: Dimensions.width5 * 17,
                        child: CupertinoButton(
                          onPressed: () async {
                            if (currPageValue + 1 != 3) {
                              if (value) {
                                _bloc.pageController
                                    .jumpToPage(currPageValue + 1);
                              }
                              if (!value) {
                                CustomDialog(
                                  context,
                                  '',
                                  currPageValue + 1 == 1
                                      ? '請至少選取一張照片'
                                      : '請完成所有必填項目',
                                  color_title,
                                  color_title,
                                  () {
                                    Navigator.pop(context);
                                  },
                                );
                              }
                            }else{
                              print('送出');
                            }

                            FocusScope.of(context).unfocus();
                          },
                          child: Text(
                            currPageValue + 1 == 3 ? 'Finish' : 'Next',
                            style: TextStyle(
                              color: !value ? color_sub_title : color_man,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
