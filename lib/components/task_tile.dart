import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rebith_tasklist/logic/tasklist_model.dart';
import 'package:rebith_tasklist/theme/theme_constants.dart';

class TaskTile extends StatefulWidget {
  final List<String> list;
  final int index;

  TaskTile({this.list, this.index});
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool check = false;
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
              }),
        ),
        title: Text(
          widget.list[widget.index],
          style: TextStyle(
              color: mainColor,
              fontFamily: 'Pacifico',
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              decoration: check ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          value: check,
          activeColor: mainColor,
          onChanged: (value) {
            setState(() {
              check = value;
            });
          },
        ),
      ),
    );
  }
}
