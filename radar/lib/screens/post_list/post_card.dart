import 'package:flutter/material.dart';
import 'package:radar/global/dimension.dart';
import 'package:radar/widgets/rate_row.dart';
import '../../global/medium_text.dart';
import '../../providers/post_list/post_card_bloc.dart';

class PostCard extends StatefulWidget {
  final String imgUrl;
  final bool isMan;
  final PostCardBloc bloc;
  final String heroTag;
  const PostCard({
    Key? key,
    required this.imgUrl,
    required this.isMan,
    required this.bloc,
    required this.heroTag,
  }) : super(key: key);

  @override
  State<PostCard> createState() => PostCardState();
}

class PostCardState extends State<PostCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color color_onPrimary = Theme.of(context).colorScheme.onPrimary;
    Color color_title = Theme.of(context).colorScheme.primary;
    Color color_sub_title = Theme.of(context).colorScheme.secondary;
    return Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.width2,
        vertical: Dimensions.height2,
      ),
      decoration: BoxDecoration(
        color: color_onPrimary,
        borderRadius: BorderRadius.all(Radius.circular(Dimensions.height5 * 2)),
      ),
      child: Column(
        children: [
          Hero(
            transitionOnUserGestures: false,
            tag: widget.heroTag,
            child: AspectRatio(
              aspectRatio: 4 / 7,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: Dimensions.width2 / 4),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.imgUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.height5 * 2),
                    topLeft: Radius.circular(Dimensions.height5 * 2),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width5 * 2,
              vertical: Dimensions.height2 * 0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Dimensions.height5 * 1.5),
                MediumText(
                  color: color_title,
                  size: Dimensions.height2 * 8,
                  text: "中原金剛芭比",
                ),
                SizedBox(height: Dimensions.height5 * 1.5),
                MediumText(
                  color: color_sub_title,
                  size: Dimensions.height2 * 7,
                  text: "中原大學",
                ),
                SizedBox(height: Dimensions.height5 * 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Column(children: [])),
                    RateRow(
                      iconPadding: Dimensions.width2 * 1.5,
                      iconSize: Dimensions.height2 * 14,
                      isMan: widget.isMan,
                      numberSize: Dimensions.height2 * 9,
                      valueNotifier: widget.bloc.rateValueNotifier,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
