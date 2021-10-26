import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:rebith_tasklist/logic/notification_logic.dart';

class NotificationAlarmButton extends StatefulWidget {
  String body;
  int id;
  bool isActive;
  Function onPressed;

  NotificationAlarmButton(
      {required this.body,
      required this.id,
      required this.isActive,
      required this.onPressed});

  @override
  _NotificationAlarmButtonState createState() =>
      _NotificationAlarmButtonState();
}

class _NotificationAlarmButtonState extends State<NotificationAlarmButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          if (widget.isActive == false) {
            DatePicker.showDateTimePicker(context,
                locale: LocaleType.ru,
                currentTime: DateTime.now(),
                maxTime: DateTime(2021, 12, 31, 0, 0), onConfirm: (date) {
              if (date.hour >= DateTime.now().hour &&
                  date.minute > DateTime.now().minute) {
                Provider.of<NotificationLogic>(context, listen: false)
                    .showNotification(
                        'Не забудь!', widget.body, date, widget.id);
                setState(() {
                  widget.onPressed();
                });
              } else {
                print('no!!!!!!!!');
              }
            });
          } else {
            Provider.of<NotificationLogic>(context, listen: false)
                .cancelNotification(widget.id);
            setState(() {
              widget.onPressed();
            });
          }
        },
        icon: Icon(
          Icons.alarm,
          color: widget.isActive ? Colors.black : Colors.grey[400],
        ));
  }
}
