import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rebith_tasklist/components/clean_tasklist_button.dart';
import 'package:rebith_tasklist/components/task_tile.dart';
import 'package:rebith_tasklist/components/addtask_button.dart';
import 'package:rebith_tasklist/logic/tasklist_model.dart';
import 'package:rebith_tasklist/theme/theme_constants.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> taskList;
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: mainColor,
        title: const Text(
          'Карина, не забудь 🐣',
          style: const TextStyle(fontFamily: 'Pacifico', fontSize: 26.0),
        ),
        actions: [CleanTaskListButton()],
      ),
      floatingActionButton: AddTaskButton(),
      body: FutureBuilder<void>(
        future: Provider.of<TasklistModel>(context, listen: false).initPrefAndList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            taskList = Provider.of<TasklistModel>(context).taskList;
            return  Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: const AssetImage('images/food3.jpg'), fit: BoxFit.cover)),
              child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: TaskTile(
                      list: taskList,
                      index: index,
                    ),
                  );
                },
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: mainColor,
            ),
          );
        },
      ),
    );
  }
}
