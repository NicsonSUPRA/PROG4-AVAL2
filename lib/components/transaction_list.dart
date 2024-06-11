import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  late List<Transaction> transactionList;
  TransactionList({super.key, required this.transactionList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView.builder(
        itemCount: transactionList.length,
        itemBuilder: (ctx, index) {
          final transaction = transactionList[index];
          return Card(
            child: Row(
              children: [
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: Theme.of(context).primaryColorDark)),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'R\$ ' + transaction.value.toStringAsFixed(2),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat('d/MM/y').format(transaction.date),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
