import 'package:flutter/material.dart';
import 'package:radar/valueNotifier/int_value_notifier.dart';
import '../global/colors.dart';

class RateRow extends StatefulWidget {
  final double iconSize;
  final double iconPadding;
  final double numberSize;
  final bool isMan;
  final IntValueNotifier valueNotifier;
  const RateRow({
    super.key,
    required this.iconPadding,
    required this.iconSize,
    required this.isMan,
    required this.numberSize,
    required this.valueNotifier,
  });

  @override
  State<RateRow> createState() => _RateRowState();
}

class _RateRowState extends State<RateRow> {
  @override
  void initState() {
    super.initState();

  }
  int previousNumber = -1;

  @override
  Widget build(BuildContext context) {
    Color _color_arrow = widget.isMan ? color_man_opacity : color_woman_opacity;
    Color _color_vote = widget.isMan ? color_man : color_woman;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (widget.valueNotifier.value == 0) return;
            previousNumber = widget.valueNotifier.value;
            widget.valueNotifier.value = previousNumber - 1;
          },
          child: Icon(
            Icons.arrow_circle_down,
            size: widget.iconSize,
            color: _color_arrow,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: widget.iconPadding,
          ),
          child: ValueListenableBuilder(
              valueListenable: widget.valueNotifier,
              builder: (context, value, child) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    final position = Tween<Offset>(
                      begin: (previousNumber < value)
                          ? (animation.status == AnimationStatus.completed)
                              ? const Offset(0, 1)
                              : const Offset(0, -1)
                          : (animation.status == AnimationStatus.completed)
                              ? const Offset(0, -1)
                              : const Offset(0, 1),
                      end: Offset.zero,
                    ).animate(animation);
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: position,
                        child: child,
                      ),
                    );
                  },
                  child: Text(
                    value.toString(),
                    key: UniqueKey(),
                    style: TextStyle(
                      fontSize: widget.numberSize,
                      fontWeight: FontWeight.bold,
                      color: _color_vote,
                    ),
                  ),
                );
              }),
        ),
        GestureDetector(
          onTap: () {
            previousNumber = widget.valueNotifier.value;
            widget.valueNotifier.value = previousNumber + 1;
          },
          child: Icon(
            Icons.arrow_circle_up,
            size: widget.iconSize,
            color: _color_arrow,
          ),
        ),
      ],
    );
  }
}
