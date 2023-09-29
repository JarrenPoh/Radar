import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/widgets/custom/custom_dialog.dart';
import 'package:share_plus/share_plus.dart';
import '../../global/colors.dart';
import '../../global/dimension.dart';

class DetailAppBar extends StatefulWidget {
  final bool isMan;
  const DetailAppBar({
    super.key,
    required this.isMan,
  });

  @override
  State<DetailAppBar> createState() => _DetailAppBarState();
}

class _DetailAppBarState extends State<DetailAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController animateController;
  late Animation<double> animation;
  bool isFollow = false;
  bool isAnimate = true;
  @override
  void initState() {
    super.initState();
    animateController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    animation = Tween<double>(begin: 1, end: 0.5).animate(animateController);
    animateController.reverseDuration = Duration(milliseconds: 0);
  }

  @override
  void dispose() {
    animateController.dispose();
    super.dispose();
  }

  tapFollow(color_sub_title, color_title) async {
    if (!isFollow) {
      if (isAnimate) {
        isFollow = !isFollow;
        Get.snackbar(
          "追蹤成功",
          "已將這篇文章加入你的追蹤集~",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(
            seconds: 2,
          ),
        );
        await animateController.forward();
      }
    } else {
      await CustomDialog(
        context,
        '提示',
        '確定要取消對??的追蹤？',
        color_sub_title,
        color_title,
        () async {
          Navigator.pop(context);
          if (isAnimate) {
            isFollow = !isFollow;
            await animateController.reverse();
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Color color_onPrimary = Theme.of(context).colorScheme.onPrimary;
    Color color_onSecondary = Theme.of(context).colorScheme.onSecondary;
    Color color_title = Theme.of(context).colorScheme.primary;
    Color color_sub_title = Theme.of(context).colorScheme.secondary;

    return Container(
      padding: EdgeInsets.only(
        top: Dimensions.height5 * 10,
        left: Dimensions.width5 * 2,
        right: Dimensions.width5 * 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Dimensions.height5 * 8,
            height: Dimensions.height5 * 8,
            decoration: BoxDecoration(
              color: color_onPrimary.withOpacity(0.85),
              borderRadius: BorderRadius.circular(10),
            ),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.chevron_left,
                color: color_onSecondary,
                size: Dimensions.height2 * 15,
              ),
            ),
          ),
          Expanded(child: Column(children: [])),
          AnimatedBuilder(
            animation: animateController,
            builder: (context, child) {
              return GestureDetector(
                onTap: () => tapFollow(color_sub_title, color_title),
                child: Container(
                  height: Dimensions.height5 * 8,
                  width: Dimensions.width5 * 20 * animation.value,
                  decoration: BoxDecoration(
                    color: color_onPrimary.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isFollow ? Icons.done : Icons.add,
                        color: color_woman,
                      ),
                      Text(
                        isFollow ? '' : '  Follow',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: color_title),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(width: Dimensions.width5),
          Container(
            width: Dimensions.height5 * 8,
            height: Dimensions.height5 * 8,
            decoration: BoxDecoration(
              color: color_onPrimary.withOpacity(0.85),
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              iconSize: Dimensions.height5 * 7,
              onPressed: () async {
                String postLink = 'https://example.com';
                await Share.share(
                  '- 快來看中原大學的中原小辣椒\n\n' + postLink,
                  subject: '中原大學的中原小辣椒',
                );
              },
              icon: Icon(
                Icons.share_rounded,
                color: color_onSecondary,
                size: Dimensions.height2 * 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
