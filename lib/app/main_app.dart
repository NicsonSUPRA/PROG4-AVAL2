import 'package:expenses/models/task.dart';
import 'package:expenses/pages/main_page.dart';
import 'package:flutter/material.dart';

class ExpensesApp extends StatelessWidget {
  ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expenses",
      theme: ThemeData(
        colorSchemeSeed: Colors.purpleAccent,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
