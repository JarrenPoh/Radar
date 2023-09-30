import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radar/global/dimension.dart';
import 'package:radar/global/medium_text.dart';
import 'package:radar/global/regular_text.dart';
import 'package:radar/providers/add_post_page/add_other_bloc.dart';
import 'package:radar/widgets/custom/custom_modal_sheet.dart';
import 'package:radar/widgets/edit/edit_textfield.dart';

class AddOther extends StatefulWidget {
  final AddOtherBloc bloc;
  const AddOther({
    super.key,
    required this.bloc,
  });

  @override
  State<AddOther> createState() => _AddOtherState();
}

class _AddOtherState extends State<AddOther> {
  List widgets = [];
  @override
  Widget build(BuildContext context) {
    Color color_title = Theme.of(context).colorScheme.primary;
    Color color_sub_title = Theme.of(context).colorScheme.secondary;
    Color color_container = Theme.of(context).colorScheme.primaryContainer;
    widgets = [
      EditTextField(
        focusNode: widget.bloc.otherContentFocusNode,
        textEditingController: widget.bloc.otherContentController,
        isDone: widget.bloc.isOtherContent,
        maxLength: 400,
        maxLines: 10,
        onChanged: () {
          if (widget.bloc.otherContentController.text.isNotEmpty) {
            Provider.of<AddOtherBloc>(context, listen: false)
                .isOtherContentChange(true);
          } else {
            Provider.of<AddOtherBloc>(context, listen: false)
                .isOtherContentChange(false);
          }
          if (Provider.of<AddOtherBloc>(context, listen: false)
                  .isOtherContent ==
              true) {
            widget.bloc.addOtherNotifier.boolChange(true);
          } else {
            widget.bloc.addOtherNotifier.boolChange(false);
          }
        },
      ),
      Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: Dimensions.height5 * 3,
          horizontal: Dimensions.width5 * 3,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: color_container),
          borderRadius: BorderRadius.circular(Dimensions.height5),
        ),
        child: Column(
          children: [
            Wrap(
              children: List.generate(
                widget.bloc.managersChose.length,
                (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: Dimensions.width5,
                      vertical: Dimensions.height5,
                    ),
                    child: RegularText(
                      color: color_title,
                      size: Dimensions.height2 * 8,
                      text: '#${widget.bloc.managers[index]}',
                    ),
                  );
                },
              ),
            ),
            CupertinoButton(
              child: Icon(
                Icons.add,
                color: color_sub_title,
                size: Dimensions.height5 * 6,
              ),
              onPressed: () {
                CustomModalSheet(
                    context,
                    widget.bloc.managerFocusNode,
                    widget.bloc.managerController,
                    widget.bloc.managers,
                    widget.bloc.managerListNotifier, (value) {
                  setState(() {
                    widget.bloc.ismanager = value['isChose'];
                    widget.bloc.managersChose.add(value['chose']);
                  });
                });
              },
            ),
          ],
        ),
      ),
    ];

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            widget.bloc.others.length,
            (index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(width: Dimensions.width5 * 2),
                      MediumText(
                        color: color_sub_title,
                        size: Dimensions.height2 * 7.5,
                        text: widget.bloc.others[index].values.toList()[0],
                      ),
                      SizedBox(width: Dimensions.width5),
                      if (widget.bloc.others[index].values.toList()[1] == true)
                        Text(
                          '*',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: Dimensions.height5 * 4,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: Dimensions.height2 * 2),
                  widgets[index],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
