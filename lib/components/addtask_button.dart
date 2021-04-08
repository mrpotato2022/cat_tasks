import 'package:flutter/material.dart';
import 'addTaskBottomSheet.dart';
import 'package:rebith_tasklist/theme/theme_constants.dart';


class AddTaskButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.0,
      width: 70.0,
      child: FloatingActionButton(
          backgroundColor: mainColor,
          child: const Icon(
            Icons.add,
            size: 44.0,
          ),
          onPressed: () {
            showModalBottomSheet<dynamic>(
                context: context,
                builder: (context) => AddTaskBottomSheet());
          }),
    );
  }
}