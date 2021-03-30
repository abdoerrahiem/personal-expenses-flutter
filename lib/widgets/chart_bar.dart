import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final int spendingAmount;
  final double spendingPercentageTotal;

  ChartBar({
    required this.label,
    required this.spendingAmount,
    required this.spendingPercentageTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: FittedBox(
            child: Text(
              NumberFormat.currency(
                locale: 'id',
                decimalDigits: 0,
                symbol: 'Rp ',
              ).format(
                spendingAmount,
              ),
            ),
          ),
          height: 20,
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                color: Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FractionallySizedBox(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              heightFactor: spendingPercentageTotal,
            )
          ]),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}

// video 44
