import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final void Function(bool?) checkboxCallback;
  final void Function() longPressCallback;

  TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.longPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
          decorationColor:
              isChecked ? Colors.lightBlue : Colors.transparent, // Line color
          decorationThickness: 2.0, // Thickness of the line
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkboxCallback,
        activeColor: Colors.lightBlue, // Checkbox tick color
      ),
    );
  }
}
