import 'dart:math';

import 'package:expenses/components/transaction_chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Task> _tasks = [];

  // List<Task> get _recentTransactions {
  //   return _tasks.where((transaction) {
  //     return transaction.date
  //         .isAfter(DateTime.now().subtract(Duration(days: 7)));
  //   }).toList();
  // }

  _taskAdd(String title, String description) {
    final newTask = Task(
        id: Random().nextInt(100).toString(),
        title: title,
        description: description,
        date: DateTime.now());
    setState(() {
      _tasks.add(newTask);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(onSubmit: _taskAdd);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
        centerTitle: true,
        backgroundColor: Theme.of(context).focusColor,
        actions: [
          IconButton(
              onPressed: () => _openTransactionFormModal(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [TaskList(taskList: _tasks)],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
        splashColor: Theme.of(context).shadowColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
