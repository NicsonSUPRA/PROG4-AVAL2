import 'dart:convert';
import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> tasks = [];
  final String dbUrl = "https://teste-1c701-default-rtdb.firebaseio.com/";

  Future<void> save(String title, String description, DateTime date) async {
    final response = await http.post(Uri.parse("${dbUrl}/tasks.json"),
        body: jsonEncode({
          'title': title,
          'description': description,
          'date': date.toIso8601String(),
        }));

    final body = jsonDecode(response.body);

    tasks.add(Task(
        id: body['name'], title: title, description: description, date: date));
    notifyListeners();
  }

  Future<void> update() async {}

  Future<void> load() async {
    final response = await http.get(Uri.parse("${dbUrl}/tasks.json"));
    final Map<String, dynamic> body = jsonDecode(response.body);
    body.forEach((key, value) {
      Task task = Task(
          id: key,
          title: value['title'],
          description: value['description'],
          date: DateTime.parse(value['date']));
      tasks.add(task);
    });
    notifyListeners();
  }
}
