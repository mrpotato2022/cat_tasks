import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TasklistModel extends ChangeNotifier {
  Box taskBox;
  List<String> taskList;

  Future<void> initHive() async {
    await Hive.initFlutter();
    taskBox = await Hive.openBox('taskBox');
    taskList = taskBox.get('tasklist') ?? [];
  }

  void addTask(String task) {
    taskList.add(task);
    taskBox.put('tasklist', taskList);
    notifyListeners();
  }

  void removeTask(int index) {
    taskList.removeAt(index);
    taskBox.put('tasklist', taskList);
    notifyListeners();
  }

  void cleanList() {
    taskList.clear();
    taskBox.put('tasklist', taskList);
    notifyListeners();
  }
}
