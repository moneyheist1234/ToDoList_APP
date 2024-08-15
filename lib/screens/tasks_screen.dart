import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/models/task_data.dart';
import 'package:untitled3/screens/add_task_screen.dart';
import 'package:untitled3/widgets/task_tile.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 5.0,
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 60.0, left: 30.0, bottom: 30.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: 30.0,
                  ),
                  radius: 30.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'To Do List',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Consumer<TaskData>(
                builder: (context, taskData, child) {
                  return ListView.builder(
                    itemCount: taskData.taskCount,
                    itemBuilder: (context, index) {
                      final task = taskData.tasks[index];
                      return TaskTile(
                        isChecked: task.isDone,
                        taskTitle: task.name,
                        checkboxCallback: (checkboxState) {
                          taskData.updateTask(task);
                        },
                        longPressCallback: () {
                          taskData.deleteTask(task);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
