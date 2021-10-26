import 'package:hive/hive.dart';

part 'Task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  bool check = false;
  @HiveField(2)
  bool isScheduled = false;

  Task({required this.title});
}
