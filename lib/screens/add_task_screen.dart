import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
            ),
          ),
          child: Column(
            children: [
              const Text(
                'ADD Task',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 30.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextField(
                onChanged: (newText) {
                  newTaskTitle = newText;
                },
                textAlign: TextAlign.center,
                autofocus: true,
                cursorColor: Color(0xFF87CEEB), // Custom sky blue color
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              TextButton(
                onPressed: () {
                  // Dismiss the keyboard
                  FocusScope.of(context).unfocus();

                  // Add the task using TaskData
                  if (newTaskTitle != null && newTaskTitle!.isNotEmpty) {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(newTaskTitle!);
                    Navigator.pop(context); // Close the bottom sheet
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 10.0),
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
