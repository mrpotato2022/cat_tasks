import 'package:flutter/material.dart';
import 'package:rebith_tasklist/logic/tasklist_model.dart';
import 'package:rebith_tasklist/theme/theme_constants.dart';
import 'package:provider/provider.dart';

class AddTaskBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        height: 440,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: const Radius.circular(20.0),
                topRight: const Radius.circular(20.0))),
        child: Padding(
              padding: EdgeInsets.only(
                  top: 10.0,
                  left: 8.0,
                  right: 8.0,
                  ),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    autofocus: true,
                    cursorColor: mainColor,
                    onSubmitted: (value) {
                      if (controller.text.isNotEmpty) {
                        Provider.of<TasklistModel>(context, listen: false)
                            .addTask(value);
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
                      Provider.of<TasklistModel>(context, listen: false)
                          .addTask(controller.text);
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
