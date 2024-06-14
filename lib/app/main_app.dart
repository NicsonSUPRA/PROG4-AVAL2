import 'package:expenses/models/task.dart';
import 'package:expenses/pages/main_page.dart';
import 'package:expenses/provider/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpensesApp extends StatelessWidget {
  ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: MaterialApp(
        title: "Expenses",
        theme: ThemeData(
          colorSchemeSeed: Colors.purpleAccent,
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
