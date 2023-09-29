import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_assets_picker/insta_assets_picker.dart';
import 'package:radar/global/dimension.dart';
import 'package:radar/global/medium_text.dart';
import 'package:radar/providers/add_post/add_picture_bloc.dart';
import '../../global/colors.dart';

class AddPicture extends StatefulWidget {
  final AddPictureBloc bloc;
  const AddPicture({
    super.key,
    required this.bloc,
  });

  @override
  State<AddPicture> createState() => _AddPictureState();
}

class _AddPictureState extends State<AddPicture>
    with AutomaticKeepAliveClientMixin {
  @override
  final bool wantKeepAlive = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.bloc.imgStreamController.close();
    super.dispose();
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
      maxAssets: widget.bloc.maxAssets,
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
          widget.bloc.imgStreamController.add(event);
        });
        widget.bloc.addPictureNotifier.boolChange(true);
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ;
    Color color_sub_title = Theme.of(context).colorScheme.secondary;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: Dimensions.height5 * 8),
          SizedBox(
            height: Dimensions.height5 * 100,
            child: StreamBuilder<InstaAssetsExportDetails>(
                stream: widget.bloc.imgStreamController.stream,
                builder: (context, snapshot) {
                  widget.bloc.assetPics = snapshot.data?.croppedFiles ?? [];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            widget.bloc.assetPics.isNotEmpty
                                ? widget.bloc.assetPics.length + 1
                                : 10,
                            (index) {
                              return Row(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      await callPicker();
                                    },
                                    child: AspectRatio(
                                      aspectRatio: 4 / 7,
                                      child: widget.bloc.assetPics.isEmpty ||
                                              index ==
                                                  widget.bloc.assetPics.length
                                          ? DottedBorder(
                                              borderType: BorderType.RRect,
                                              radius: Radius.circular(
                                                Dimensions.height2 * 6,
                                              ),
                                              dashPattern: [6, 5],
                                              color: color_sub_title,
                                              child: Center(
                                                child: Icon(
                                                  Icons.add,
                                                  color: color_sub_title,
                                                  size:
                                                      Dimensions.height5 * 7,
                                                ),
                                              ))
                                          : Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                Dimensions.height2 * 6,
                                              ),
                                              image: DecorationImage(
                                                image: FileImage(
                                                  widget.bloc
                                                      .assetPics[index],
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                    ),
                                  ),
                                  SizedBox(width: Dimensions.width5 * 4),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.height5 * 3),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: Dimensions.width5 * 17,
                            child: MediumText(
                              color: color_sub_title,
                              size: Dimensions.height5 * 2.5,
                              text:
                                  '已選取 ${widget.bloc.assetPics.length}/${widget.bloc.maxAssets}',
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
