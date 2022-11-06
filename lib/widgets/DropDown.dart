import 'dart:js';

import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';

void dropDownOpen(List<SelectedListItem> cities) {
  DropDownState(
    DropDown(
      bottomSheetTitle: const Text(
        "cities",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      submitButtonChild: const Text(
        'Done',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      data: cities ?? [],
      selectedItems: (List<dynamic> selectedList) {
        List<String> list = [];
        for(var item in selectedList) {
          if(item is SelectedListItem) {
            list.add(item.name);
          }
        }
        showSnackBar(list.toString());
      },
      enableMultipleSelection: true,
    ),
  ).showModal(context);
}

void showSnackBar(String string) {
}
