import 'package:flutter/material.dart';
import 'package:radar/valueNotifier/int_value_notifier.dart';
import '../../global/colors.dart';
import '../../global/dimension.dart';
import '../../providers/post_detail/post_detail_bloc.dart';
import '../../widgets/rate_row.dart';

class DetailNavigationBar extends StatefulWidget {
  final bool isMan;
  final Widget commentDismissible;
  final Widget versionDismissible;
  final PostDetailBloc bloc;
  final IntValueNotifier rateValueNotifier;

  const DetailNavigationBar({
    super.key,
    required this.isMan,
    required this.commentDismissible,
    required this.versionDismissible,
    required this.bloc,
    required this.rateValueNotifier,
  });

  @override
  State<DetailNavigationBar> createState() => _DetailNavigationBarState();
}

class _DetailNavigationBarState extends State<DetailNavigationBar> {
  @override
  Widget build(BuildContext context) {
    Color color_onPrimary = Theme.of(context).colorScheme.onPrimary;
    Color color_onSecondary = Theme.of(context).colorScheme.onSecondary;
    Color color_title = Theme.of(context).colorScheme.primary;
    Color color_container = Theme.of(context).colorScheme.primaryContainer;

    return Container(
      padding: EdgeInsets.only(
        top: Dimensions.height5 * 2,
        left: Dimensions.width5 * 3,
        right: Dimensions.width5 * 3,
      ),
      decoration: BoxDecoration(
        color: color_onPrimary,
        border: Border(
          top: BorderSide(color: color_container),
        ),
      ),
      height: Dimensions.height5 * 18,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: Dimensions.height5 * 1),
            child: RateRow(
              iconPadding: Dimensions.width5 * 2,
              iconSize: Dimensions.height5 * 7,
              isMan: true,
              numberSize: Dimensions.height5 * 5,
              valueNotifier: widget.rateValueNotifier,
            ),
          ),
          Expanded(child: Column(children: [])),
          ValueListenableBuilder(
            valueListenable: widget.bloc.likeValueNotifier,
            builder: (context, value, child) {
              value as bool;
              return Row(
                children: [
                  SizedBox(
                    width: Dimensions.width5 * 7.5,
                    child: IconButton(
                      onPressed: () {
                        widget.bloc.likeValueNotifier.boolChange(!value);
                      },
                      icon: Icon(
                        value ? Icons.favorite : Icons.favorite_outline_rounded,
                        color: value ? color_woman : color_onSecondary,
                        size: Dimensions.height5 * 5,
                      ),
                    ),
                  ),
                  Text('2.3k', style: TextStyle(color: color_title)),
                ],
              );
            },
          ),
          Row(
            children: [
              SizedBox(
                width: Dimensions.width5 * 7.5,
                child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      // backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => widget.commentDismissible,
                    );
                  },
                  icon: Icon(
                    Icons.messenger_outline_rounded,
                    color: color_onSecondary,
                    size: Dimensions.height5 * 5,
                  ),
                ),
              ),
              Text('2.3k', style: TextStyle(color: color_title)),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: Dimensions.width5 * 7.5,
                child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      // backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => widget.versionDismissible,
                    );
                  },
                  icon: Icon(
                    Icons.info_outline_rounded,
                    color: color_onSecondary,
                    size: Dimensions.height5 * 5,
                  ),
                ),
              ),
              Text('2.0.7', style: TextStyle(color: color_title)),
            ],
          ),
        ],
      ),
    );
  }
}
