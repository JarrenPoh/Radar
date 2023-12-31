import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radar/global/dimension.dart';
import '../global/colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  CustomBottomNavigationBar({
    super.key,
    required this.onIconTap,
    required this.selectedPageIndex,
  });
  final int selectedPageIndex;
  final Function onIconTap;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late int selectedPage;
  @override
  void initState() {
    super.initState();
    selectedPage = widget.selectedPageIndex;
  }

  final List iconList = [
    Icons.home_filled,
    CupertinoIcons.search,
    Icons.add,
    Icons.inbox_rounded,
    CupertinoIcons.profile_circled,
  ];

  final List labelText = ["home", "search", "", "inbox", "profile"];

  @override
  Widget build(BuildContext context) {
    Color color_onPrimary = Theme.of(context).colorScheme.onPrimary;
    final barHeight = MediaQuery.of(context).size.height * 0.06;
    final style = Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: Dimensions.height2 * 5.5,
        );
    return BottomAppBar(
      color: color_onPrimary,
      child: Container(
        height: barHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _bottomBarNavItem(0, style, context),
            _bottomBarNavItem(1, style, context),
            _addItem(2, barHeight, context),
            _bottomBarNavItem(3, style, context),
            _bottomBarNavItem(4, style, context),
          ],
        ),
      ),
    );
  }

  _bottomBarNavItem(
    int index,
    TextStyle textStyle,
    BuildContext context,
  ) {
    bool isSelected = selectedPage == index;
    Color iconAndTextColor = isSelected
        ? Theme.of(context).colorScheme.onSecondary
        : Theme.of(context).colorScheme.secondary;

    return GestureDetector(
      onTap: () {
        widget.onIconTap(index);
        setState(() {
          selectedPage = index;
        });
      },
      child: SizedBox(
        width: Dimensions.width5 * 14,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: Dimensions.height2 * 1.5),
            Icon(
              iconList[index],
              color: iconAndTextColor,
              size: Dimensions.height5 * 5,
            ),
            Text(
              labelText[index],
              style: textStyle.copyWith(
                color: iconAndTextColor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _addItem(index, height, BuildContext context) {
    return GestureDetector(
      onTap: () => {widget.onIconTap(index)},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height - 15,
            width: Dimensions.width5 * 8,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color_man, color_woman],
              ),
              borderRadius: BorderRadius.circular(Dimensions.height2 * 4),
            ),
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
