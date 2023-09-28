import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_assets_picker/insta_assets_picker.dart';
import 'package:radar/global/bold_text.dart';
import 'package:radar/global/colors.dart';
import 'package:radar/global/dimension.dart';
import 'package:radar/global/medium_text.dart';
import 'package:radar/providers/add_post_page_bloc.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  final AddPostPageBloc _bloc = AddPostPageBloc();

  @override
  void initState() {
    super.initState();
  }

  Future<List<AssetEntity>?> callPicker() {
    final theme = InstaAssetPicker.themeData(Theme.of(context).primaryColor);
    Color color_onPrimary = Theme.of(context).colorScheme.onPrimary;
    Color color_title = Theme.of(context).colorScheme.primary;
    Color color_sub_title = Theme.of(context).colorScheme.secondary;
    Color color_scaffold = Theme.of(context).colorScheme.background;
    return InstaAssetPicker.pickAssets(
      context,
      title: '選取照片',
      maxAssets: 10,
      pickerTheme: theme.copyWith(
        canvasColor: color_onPrimary, // body background color
        splashColor: color_sub_title, // ontap splash color
        colorScheme: theme.colorScheme.copyWith(
          background: color_scaffold, // albums list background color
        ),
        appBarTheme: theme.appBarTheme.copyWith(
          backgroundColor: color_onPrimary, // app bar background color
          titleTextStyle:
              Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                    color: color_title,
                  ), // change app bar title text style to be like app theme
        ),
        // edit `confirm` button style
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: color_man,
          ),
        ),
      ),
      cropDelegate: InstaAssetCropDelegate(
        preferredSize: 1080,
        cropRatios: [4 / 7],
      ),
      onCompleted: (Stream<InstaAssetsExportDetails> stream) {
        stream.listen((event) {
          _bloc.imgStreamController.add(event);
        });
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width / 2 - 8;
    double cardHeight = MediaQuery.of(context).size.height / 3 - 35;
    Color color_onPrimary = Theme.of(context).colorScheme.onPrimary;
    Color color_onSecondary = Theme.of(context).colorScheme.onSecondary;
    Color color_title = Theme.of(context).colorScheme.primary;
    Color color_sub_title = Theme.of(context).colorScheme.secondary;
    Color color_scaffold = Theme.of(context).colorScheme.background;
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
        trailing: CupertinoButton(
          padding: EdgeInsets.only(bottom: 0),
          onPressed: () {},
          child: Text(
            'Post',
            style: TextStyle(color: color_man),
          ),
        ),
      ),
      // 页面内容
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width5 * 2,
          vertical: Dimensions.height5 * 2,
        ),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height5 * 60,
              child: StreamBuilder<InstaAssetsExportDetails>(
                  stream: _bloc.imgStreamController.stream,
                  builder: (context, snapshot) {
                    print('object');
                    List assets = snapshot.data?.croppedFiles ?? [];
                    print(assets.length);
                    return ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        assets.isNotEmpty ? assets.length + 1 : 10,
                        (index) {
                          return Row(
                            children: [
                              AspectRatio(
                                aspectRatio: 4 / 7,
                                child: assets.isEmpty || index == assets.length
                                    ? DottedBorder(
                                        borderType: BorderType.RRect,
                                        radius: Radius.circular(
                                          Dimensions.height2 * 6,
                                        ),
                                        dashPattern: [6, 5],
                                        color: color_sub_title,
                                        child: Center(
                                          child: CupertinoButton(
                                            onPressed: () async {
                                              await callPicker();
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: color_sub_title,
                                              size: Dimensions.height5 * 7,
                                            ),
                                          ),
                                        ))
                                    : Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            Dimensions.height2 * 6,
                                          ),
                                        ),
                                        child: Image.file(
                                          assets[index],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                              ),
                              SizedBox(width: Dimensions.width5 * 4),
                            ],
                          );
                        },
                      ),
                    );
                  }),
            ),
            SizedBox(width: Dimensions.height5 * 2),
            Text(
              'Your content goes here',
              style: TextStyle(color: color_title),
            ),
          ],
        ),
      ),
    );
  }
}
