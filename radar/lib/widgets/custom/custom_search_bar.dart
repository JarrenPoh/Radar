import 'package:flutter/material.dart';
import 'package:radar/global/colors.dart';
import 'package:radar/global/dimension.dart';

class CustomSearchBar extends StatefulWidget {
  final TextEditingController textEditingController;
  final Function onSubmitted;
  final Function cancel;
  const CustomSearchBar({
    super.key,
    required this.textEditingController,
    required this.onSubmitted,
    required this.cancel,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar>
    with SingleTickerProviderStateMixin {
  late AnimationController animateController;
  late Animation<double> animation;
  FocusNode focusNode = FocusNode();

  bool isAnimate = true;
  bool cancelBtn = false;

  @override
  void initState() {
    super.initState();
    animateController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    animation = Tween<double>(begin: 0, end: 1).animate(animateController);

    animateController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          cancelBtn = true;
          isAnimate = false;
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          cancelBtn = false;
          isAnimate = true;
        });
      }
    });
  }

  @override
  void dispose() {
    animateController.dispose();
    super.dispose();
  }

  void tapSearchBox() async {
    if (isAnimate) {
      focusNode.requestFocus();
      await animateController.forward();
    }
    if (!focusNode.hasFocus) {
      focusNode.requestFocus();
    }
  }

  void cancel() {
    FocusManager.instance.primaryFocus?.unfocus();
    widget.textEditingController.clear();
    animateController.reverse();
    widget.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Color color_sub_title = Theme.of(context).colorScheme.secondary;
    Color color_title = Theme.of(context).colorScheme.primary;

    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
      borderRadius: BorderRadius.circular(15),
    );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: tapSearchBox,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          if (cancelBtn)
            GestureDetector(
              onTap: cancel,
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: color_sub_title,
                  fontSize: 16,
                ),
              ),
            ),
          AnimatedBuilder(
            animation: animateController,
            builder: (context, child) {
              return Container(
                padding: EdgeInsets.only(
                  right: Dimensions.width5 * 12 * animation.value,
                ),
                child: IgnorePointer(
                  child: TextField(
                    focusNode: focusNode,
                    cursorColor: color_man,
                    style: TextStyle(color: color_title),
                    controller: widget.textEditingController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: Dimensions.height2 * 6,
                      ),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: color_man,
                      ),
                      border: inputBorder,
                      focusedBorder: inputBorder,
                      enabledBorder: inputBorder,
                      hintText: '輸入關鍵字',
                    ),
                    onSubmitted: (String) {
                      widget.onSubmitted();
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
