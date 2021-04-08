import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TasklistModel extends ChangeNotifier {
  SharedPreferences pref;
  List<String> taskList;

  Future<void> initPrefAndList() async {
    pref = await SharedPreferences.getInstance();
    taskList = pref.getStringList('tasks') ?? [];
  }

  void addTask(String task) {
    taskList.add(task);
    pref.setStringList('tasks', taskList);
    notifyListeners();
  }

  void removeTask(int index) {
    taskList.removeAt(index);
    pref.setStringList('tasks', taskList);
    notifyListeners();
  }

  void cleanList() {
    taskList.clear();
    pref.remove('tasks');
    notifyListeners();
  }
}
