import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction({required this.addNewTransaction});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final title = TextEditingController();
  final amount = TextEditingController();

  void submitData() {
    final enteredTitle = title.text;
    final enteredAmount = int.parse(amount.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addNewTransaction(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Judul'),
              controller: title,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Jumlah'),
              keyboardType: TextInputType.number,
              controller: amount,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              child: Text('Tambah Transaksi'),
              onPressed: submitData,
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.purple)),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.end,
        ),
        padding: EdgeInsets.all(10),
      ),
      elevation: 5,
    );
  }
}
