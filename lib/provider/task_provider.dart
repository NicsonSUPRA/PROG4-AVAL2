import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> taks = [];
  final String dbUrl = "https://teste-1c701-default-rtdb.firebaseio.com/";

  Future<void> save(Task task) async {
    final response = await http.post(Uri.parse("${dbUrl}/tasks.json"),
        body: jsonEncode({
          "title": task.title,
          "description": task.description,
          "date": task.date.toIso8601String()
        }));
  }

  Future<void> update() async {}

  Future<void> load() async {}
}
