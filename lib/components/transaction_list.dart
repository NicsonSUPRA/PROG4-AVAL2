import 'package:expenses/models/task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskList extends StatelessWidget {
  late List<Task> taskList;
  TaskList({super.key, required this.taskList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (ctx, index) {
          final task = taskList[index];
          return Card(
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat('d/MM/y').format(task.date),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Text(task.description)
              ],
            ),
          );
        },
      ),
    );
  }
}
