import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:rebith_tasklist/logic/Task.dart';
import 'package:rebith_tasklist/logic/notification_logic.dart';
import 'package:rebith_tasklist/logic/tasklist_model.dart';
import 'package:rebith_tasklist/screens/tasklistScreen.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(TaskAdapter());
  tz.initializeTimeZones();
  runApp(TaskList());
}

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ListenableProvider<TasklistModel>(create:(context) => TasklistModel()),
        ListenableProvider<NotificationLogic>(create: (context) => NotificationLogic())
      ],
      child: MaterialApp(home: TaskListScreen()),
    );
  }
}
