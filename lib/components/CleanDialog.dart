import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rebith_tasklist/logic/notification_logic.dart';
import 'package:rebith_tasklist/logic/tasklist_model.dart';


class CleanDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Очистить список?',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                    color: Color(0xFF008eff)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        Provider.of<TasklistModel>(context, listen: false)
                            .cleanList();
                        Provider.of<NotificationLogic>(context, listen: false)
                            .cancelAllNotifications();
                        Navigator.of(context).pop();
                      },
                      icon:
                          Icon(Icons.done, size: 46.0, color: Color(0xFF008eff))),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close,
                          size: 46.0, color: Color(0xFF008eff))),
                ],
              )
            ],
          ),
      ),

    );
  }
}
