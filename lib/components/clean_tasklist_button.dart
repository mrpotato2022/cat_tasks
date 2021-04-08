import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rebith_tasklist/logic/tasklist_model.dart';

class CleanTaskListButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.clear),
        color: Colors.white,
        iconSize: 30.0,
        onPressed: () {
          Provider.of<TasklistModel>(context, listen: false).cleanList();
        });
  }
}
