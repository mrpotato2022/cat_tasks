import 'package:flutter/material.dart';
import 'package:rebith_tasklist/logic/tasklist_model.dart';
import 'package:rebith_tasklist/theme/theme_constants.dart';
import 'package:provider/provider.dart';

class AddTaskBottomSheet extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.only(
            top: 10.0,
            left: 10.0,
            right: 10.0,
            bottom: MediaQuery.of(context).viewInsets.bottom
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Padding(
          padding: EdgeInsets.only(
              bottom: 10.0
          ),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    autofocus: true,
                    cursorColor: mainColor,
                    onSubmitted: (value) {
                      if (controller.text.isNotEmpty) {
                        Provider.of<TasklistModel>(context, listen: false).addTask(value);
                        controller.clear();
                        Navigator.pop(context);
                      } else {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
                RawMaterialButton(
                  fillColor: mainColor,
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                    size: 44.0,
                  ),
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      Provider.of<TasklistModel>(context, listen: false).addTask(controller.text);
                      controller.clear();
                      Navigator.pop(context);
                    }
                  },
                ),
              ]),
        ),
      ),
    );
  }
}