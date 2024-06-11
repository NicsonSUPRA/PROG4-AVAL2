import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  const Chart({super.key, required this.recentTransactions});

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      debugPrint("$weekDay");
      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        bool sameDay = recentTransactions[i].date.day == weekDay.day;
        bool sameMOnth = recentTransactions[i].date.month == weekDay.month;
        bool sameYear = recentTransactions[i].date.year == weekDay.year;

        if (sameDay && sameMOnth && sameYear) {
          totalSum += recentTransactions[i].value;
        }
      }

      return {"day": DateFormat.E().format(weekDay)[0], "value": totalSum};
    });
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0, (reviousValue, element) {
      return reviousValue + double.tryParse(element["value"].toString())!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...groupedTransactions.map((transaction) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: transaction["day"].toString(),
                percent: double.tryParse(transaction["value"].toString())! /
                    _weekTotalValue,
                value: _weekTotalValue,
              ),
            );
          })
        ],
      ),
    );
  }
}
