import 'package:flutter/material.dart';
import 'package:radar/global/dimension.dart';
import 'package:radar/global/medium_text.dart';
import 'package:radar/valueNotifier/list_value.dart';

Future<void> CustomModalSheet(
  BuildContext context,
  FocusNode focusNode,
  TextEditingController textEditingController,
  List<String> list,
  ListValueNotifier listValueNotifier,
  ValueChanged<Map> onValueChanged,
) {
  Color color_onPrimary = Theme.of(context).colorScheme.onPrimary;
  Color color_container = Theme.of(context).colorScheme.primaryContainer;
  final inputBorder =
      OutlineInputBorder(borderSide: Divider.createBorderSide(context));
  Color color_title = Theme.of(context).colorScheme.primary;
  
  void _onSearchTextChanged() {
    final searchText = textEditingController.text.toLowerCase();
    List<String> searchResults = [];

    if (searchText.isEmpty) {
      searchResults.addAll(list);
    } else {
      searchResults = list
          .where((item) => item.toLowerCase().contains(searchText))
          .toList();
    }
    listValueNotifier.listChange(searchResults);
  }

  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.85,
          minChildSize: 0.4,
          maxChildSize: 1,
          builder: (BuildContext context, ScrollController scrollController) =>
              Container(
            decoration: BoxDecoration(
              color: color_onPrimary,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(Dimensions.height5 * 6),
              ),
            ),
            padding: EdgeInsets.all(Dimensions.width2 * 3),
            child: SafeArea(
              bottom: true,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: Dimensions.width5 * 8,
                        height: Dimensions.height5 * 1.5,
                        decoration: BoxDecoration(
                          color: color_container,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width5 * 4,
                      vertical: Dimensions.height5 * 2,
                    ),
                    child: TextField(
                      onChanged: (value) {
                        _onSearchTextChanged();
                      },
                      focusNode: focusNode,
                      controller: textEditingController,
                      style: TextStyle(color: color_title),
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      decoration: InputDecoration(
                        // errorText: emptyEnter ? '不可為空' : null,
                        errorStyle: TextStyle(fontWeight: FontWeight.bold),
                        hintText: '搜尋',
                        counterText: '',
                        border: inputBorder,
                        focusedBorder: inputBorder,
                        enabledBorder: inputBorder,
                        filled: false,
                        contentPadding: const EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.height5),
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: listValueNotifier,
                      builder: (context, value, child) {
                        List schools = list;
                        value as List;
                        if (value.isNotEmpty) {
                          schools = value;
                        }
                        return ListView.builder(
                          itemCount: schools.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                onValueChanged({
                                  "isChose": true,
                                  "chose": schools[index],
                                });
                                FocusManager.instance.primaryFocus?.unfocus();
                                Navigator.pop(context);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: Dimensions.height5 * 2,
                                      horizontal: Dimensions.width5 * 4,
                                    ),
                                    child: MediumText(
                                      color: color_title,
                                      size: Dimensions.height2 * 8,
                                      text: schools[index],
                                    ),
                                  ),
                                  Divider()
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
