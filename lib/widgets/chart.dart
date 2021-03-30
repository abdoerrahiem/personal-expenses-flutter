import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart({required this.recentTransactions});

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );
        int totalSum = 0;

        for (var i = 0; i < recentTransactions.length; i++) {
          if (recentTransactions[i].date.day == weekDay.day &&
              recentTransactions[i].date.month == weekDay.month &&
              recentTransactions[i].date.year == weekDay.year) {
            totalSum += recentTransactions[i].amount;
          }
        }

        return {
          'day': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': totalSum,
        };
      },
    ).reversed.toList();
  }

  double get totalSpending => groupedTransactionValues.fold(
      0.0, (sum, item) => sum + (item['amount'] as num));

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        child: Row(
          children: groupedTransactionValues
              .map(
                (e) => Flexible(
                  child: ChartBar(
                      label: (e['day'] as String),
                      spendingAmount: (e['amount'] as int),
                      spendingPercentageTotal: totalSpending == 0
                          ? 0.0
                          : (e['amount'] as num) / totalSpending),
                  fit: FlexFit.tight,
                ),
              )
              .toList(),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
        padding: EdgeInsets.all(10),
      ),
      elevation: 6,
      margin: EdgeInsets.all(20),
    );
  }
}
