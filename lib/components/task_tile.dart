import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rebith_tasklist/components/notification_alarm_button.dart';
import 'package:rebith_tasklist/logic/Task.dart';
import 'package:rebith_tasklist/logic/notification_logic.dart';
import 'package:rebith_tasklist/logic/tasklist_model.dart';
import 'package:rebith_tasklist/theme/theme_constants.dart';

class TaskTile extends StatefulWidget {
  final List<Task> list;
  final int index;

  TaskTile({required this.list, required this.index});

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Padding(
          padding: EdgeInsets.only(top: 14.0),
          child: IconButton(
              icon: const Icon(
                Icons.clear,
                color: mainColor,
              ),
              onPressed: () {
                Provider.of<TasklistModel>(context, listen: false)
                    .removeTask(widget.index);
                Provider.of<NotificationLogic>(context, listen: false)
                    .cancelNotification(widget.index);
              }),
        ),
        title: Text(
          widget.list[widget.index].title,
          style: TextStyle(
              color: mainColor,
              fontFamily: 'Pacifico',
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              decoration: widget.list[widget.index].check
                  ? TextDecoration.lineThrough
                  : null),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NotificationAlarmButton(
              body: widget.list[widget.index].title,
              id: widget.index,
              isActive: widget.list[widget.index].isScheduled,
              onPressed: () {
                setState(() {
                  widget.list[widget.index].isScheduled
                      ? widget.list[widget.index].isScheduled = false
                      : widget.list[widget.index].isScheduled = true;
                  context.read<TasklistModel>().saveList();
                });
              },
            ),
            Checkbox(
              value: widget.list[widget.index].check,
              activeColor: mainColor,
              onChanged: (value) {
                setState(() {
                  widget.list[widget.index].check = value!;
                  context.read<TasklistModel>().saveList();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
