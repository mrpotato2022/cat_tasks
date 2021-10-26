import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rebith_tasklist/logic/Task.dart';

class TasklistModel extends ChangeNotifier {
  late Box taskBox;
  List<Task> taskList = [];

  Future<void> initHive() async {
    await Hive.initFlutter();
    taskBox = await Hive.openBox('taskBox');
    try {
      taskList = List<Task>.from(taskBox.get('tasklist'));
    } catch (e) {
      taskList = [];
    }
    notifyListeners();
  }

  List<Task> getTaskList() {
    return taskList;
  }

  void addTask(String title) {
    Task newTask = Task(title: title);
    taskList.add(newTask);
    saveList();
  }

  void saveList() {
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

  void removeBox() {
    Hive.box('taskBox').clear();
    Hive.deleteFromDisk();
  }
}
