import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radar/global/dimension.dart';
import 'package:radar/global/medium_text.dart';
import 'package:radar/providers/add_post/add_inform_bloc.dart';
import 'package:radar/widgets/edit/edit_person.dart';
import 'package:radar/widgets/edit/edit_radio.dart';
import 'package:radar/widgets/edit/edit_school.dart';
import 'package:radar/widgets/edit/edit_textfield.dart';

class AddInformation extends StatefulWidget {
  final AddInformBloc bloc;
  const AddInformation({
    super.key,
    required this.bloc,
  });

  @override
  State<AddInformation> createState() => _AddInformationState();
}

class _AddInformationState extends State<AddInformation> {
  List widgets = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color color_sub_title = Theme.of(context).colorScheme.secondary;
    Color color_container = Theme.of(context).colorScheme.primaryContainer;

    widgets = [
      //gender
      EditRadio(
        groupValue: widget.bloc.selectedGender,
        firstRadio: widget.bloc.genderFirst,
        secondRadio: widget.bloc.genderSecond,
      ),
      //single
      EditRadio(
        groupValue: widget.bloc.selectedSingle,
        firstRadio: widget.bloc.singleFirst,
        secondRadio: widget.bloc.singleSecond,
      ),
      //nickName
      EditTextField(
        focusNode: widget.bloc.nickNameFocusNode,
        textEditingController: widget.bloc.nickNameController,
        isDone: widget.bloc.isNickName,
        maxLength: 10,
        maxLines: 2,
        onChanged: () {
          if (widget.bloc.nickNameController.text.isNotEmpty) {
            Provider.of<AddInformBloc>(context, listen: false)
                .isNickNameChange(true);
          } else {
            Provider.of<AddInformBloc>(context, listen: false)
                .isNickNameChange(false);
          }
          if (Provider.of<AddInformBloc>(context, listen: false).isRealName == true &&
              Provider.of<AddInformBloc>(context, listen: false).isNickName == true) {
            widget.bloc.addInformNotifier.boolChange(true);
          } else {
            widget.bloc.addInformNotifier.boolChange(false);
          }
        },
      ),
      //realName
      EditTextField(
        focusNode: widget.bloc.realNameFocusNode,
        textEditingController: widget.bloc.realNameController,
        isDone: widget.bloc.isRealName,
        maxLength: 10,
        maxLines: 1,
        onChanged: () {
           if (widget.bloc.realNameController.text.isNotEmpty) {
            Provider.of<AddInformBloc>(context, listen: false)
                .isRealNameChange(true);
          } else {
            Provider.of<AddInformBloc>(context, listen: false)
                .isRealNameChange(false);
          }
          if (Provider.of<AddInformBloc>(context, listen: false).isRealName == true &&
              Provider.of<AddInformBloc>(context, listen: false).isNickName == true) {
            widget.bloc.addInformNotifier.boolChange(true);
          } else {
            widget.bloc.addInformNotifier.boolChange(false);
          }
        },
      ),
      //school
      EditSchool(
        isChose: widget.bloc.isSchool,
        list: widget.bloc.schools,
        listValueNotifier: widget.bloc.schoolListNotifier,
        textEditingController: widget.bloc.schoolController,
        chose: widget.bloc.school,
        focusNode: widget.bloc.schoolFocusNode,
      ),
      //class
      EditTextField(
        focusNode: widget.bloc.classFocusNode,
        textEditingController: widget.bloc.classController,
        isDone: false,
        maxLength: 15,
        maxLines: 2,
        onChanged: () {},
      ),
      //height
      EditPerson(
        chose: widget.bloc.height,
        choseList: widget.bloc.heightList,
        iniChose: widget.bloc.initHeight,
        isChose: widget.bloc.isHeight,
        unit: widget.bloc.unitOfHeight,
      ),
      //age
      EditPerson(
        chose: widget.bloc.age,
        choseList: widget.bloc.ageList,
        iniChose: widget.bloc.iniAge,
        isChose: widget.bloc.isAge,
        unit: widget.bloc.unitOfAge,
      ),
      //birth
      Container(),
      //starSign
      EditPerson(
        chose: widget.bloc.starSign,
        choseList: widget.bloc.starSignList,
        iniChose: widget.bloc.iniStarSign,
        isChose: widget.bloc.isStarSign,
        unit: widget.bloc.unitOfStarSign,
      ),
      //bloodType
      EditPerson(
        chose: widget.bloc.bloodType,
        choseList: widget.bloc.bloodTypeList,
        iniChose: widget.bloc.iniBloodType,
        isChose: widget.bloc.isBloodType,
        unit: widget.bloc.unitOfBloodType,
      ),
      //hobby
      EditTextField(
        focusNode: widget.bloc.hobbyFocusNode,
        textEditingController: widget.bloc.hobbyController,
        isDone: false,
        maxLength: 15,
        maxLines: 2,
        onChanged: () {},
      ),
    ];

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridView.custom(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 0, bottom: 0),
              physics: const ClampingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                childAspectRatio: 1.4,
                crossAxisSpacing: Dimensions.width5 * 0,
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: color_container),
                    ),
                    height: Dimensions.height5 * 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: Dimensions.width5 * 2),
                            MediumText(
                              color: color_sub_title,
                              size: Dimensions.height2 * 7.5,
                              text: widget.bloc.informations[index].values
                                  .toList()[0],
                            ),
                            SizedBox(width: Dimensions.width5),
                            if (widget.bloc.informations[index].values
                                    .toList()[1] ==
                                true)
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
                        SizedBox(height: Dimensions.height5),
                      ],
                    ),
                  );
                },
                childCount: widget.bloc.informations.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
