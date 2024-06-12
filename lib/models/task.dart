import 'package:flutter/material.dart';

class Task extends ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final DateTime date;

  Task(
      {required this.id,
      required this.title,
      required this.description,
      required this.date});
}
