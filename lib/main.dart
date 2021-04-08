import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rebith_tasklist/logic/tasklist_model.dart';
import 'package:rebith_tasklist/screens/tasklistScreen.dart';

void main() {
  runApp(TaskList());
}

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasklistModel(),
      child: MaterialApp(home: TaskListScreen()),
    );
  }
}
