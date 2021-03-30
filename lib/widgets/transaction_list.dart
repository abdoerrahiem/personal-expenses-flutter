import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List transactions;
  final Function deleteTransaction;

  TransactionList({
    required this.transactions,
    required this.deleteTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'Transaksi belum ditambahkan!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                  height: 200,
                )
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) => Card(
                    child: ListTile(
                      title: Text(
                        transactions[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        DateFormat('EEEE, d MMMM yyyy', 'id_ID')
                            .format(transactions[index].date),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () =>
                            deleteTransaction(transactions[index].id),
                      ),
                      leading: CircleAvatar(
                        child: Padding(
                          child: FittedBox(
                            child: Text(
                              NumberFormat.currency(
                                locale: 'id',
                                decimalDigits: 0,
                                symbol: 'Rp ',
                              ).format(transactions[index].amount),
                            ),
                          ),
                          padding: EdgeInsets.all(6),
                        ),
                        radius: 30,
                      ),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    elevation: 5,
                  )
              // Card(
              //   child: Row(
              //     children: [
              //       Container(
              //         child: Text(
              //           NumberFormat.currency(
              //             locale: 'id',
              //             decimalDigits: 0,
              //             symbol: 'Rp ',
              //           ).format(transactions[index].amount),
              //           style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 16,
              //             color: Theme.of(context).primaryColor,
              //           ),
              //         ),
              //         margin: EdgeInsets.symmetric(
              //           vertical: 10,
              //           horizontal: 15,
              //         ),
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: Theme.of(context).primaryColor,
              //             width: 2,
              //           ),
              //           borderRadius: BorderRadius.all(
              //             Radius.circular(5),
              //           ),
              //         ),
              //         padding: EdgeInsets.all(10),
              //       ),
              //       Column(
              //         children: [
              //           Text(
              //             transactions[index].title,
              //             style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 18,
              //             ),
              //           ),
              //           Text(
              //             DateFormat('dd MMMM yyyy')
              //                 .format(transactions[index].date),
              //             style: TextStyle(
              //               color: Colors.grey,
              //             ),
              //           ),
              //         ],
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //       )
              //     ],
              //   ),
              // ),
              ),
    );
  }
}
