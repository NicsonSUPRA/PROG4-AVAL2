import 'dart:math';

import 'package:expenses/components/transaction_chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int randomDay = Random().nextInt(7);
  final _transactions = [
    Transaction(
        id: "t1",
        title: "Cinema",
        value: 80.0,
        date: DateTime.now().subtract(Duration(days: 4))),
    Transaction(
        id: "t2",
        title: "Tênis",
        value: 600.0,
        date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(
        id: "t3",
        title: "Conta de Agua",
        value: 70.0,
        date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(
        id: "t4",
        title: "Bermuda",
        value: 120.0,
        date: DateTime.now().subtract(Duration(days: 7))),
    Transaction(
        id: "t5",
        title: "Perfume",
        value: 250.0,
        date: DateTime.now().subtract(Duration(days: 7))),
    Transaction(
        id: "t6",
        title: "Almoço",
        value: 70.0,
        date: DateTime.now().subtract(Duration(days: 7))),
    Transaction(
        id: "t7",
        title: "Viagem",
        value: 1000.0,
        date: DateTime.now().subtract(Duration(days: 4))),
    Transaction(
        id: "t8",
        title: "Cinema",
        value: 250.0,
        date: DateTime.now().subtract(Duration(days: 3))),
    Transaction(
        id: "t9",
        title: "Presente",
        value: 200.0,
        date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(
        id: "t9",
        title: "Presente",
        value: 300.0,
        date: DateTime.now().subtract(Duration(days: 5)))
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((transaction) {
      return transaction.date
          .isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  _transactionAdd(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextInt(100).toString(),
        title: title,
        value: value,
        date: DateTime.now());
    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(onSubmit: _transactionAdd);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas"),
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
          children: [
            Chart(
              recentTransactions: _transactions,
            ),
            TransactionList(transactionList: _transactions)
          ],
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
