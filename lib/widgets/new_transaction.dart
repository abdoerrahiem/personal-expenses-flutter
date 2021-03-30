import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction({required this.addNewTransaction});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final title = TextEditingController();
  final amount = TextEditingController();
  var _selectedDate;

  void _submitData() {
    final _enteredTitle = title.text;
    final _enteredAmount = int.parse(amount.text);

    if (_enteredTitle.isEmpty || _enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addNewTransaction(_enteredTitle, _enteredAmount, _selectedDate,);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((data) {
      if (data == null) return;

      setState(() {
        _selectedDate = data;
      });
    });
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
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Jumlah'),
              keyboardType: TextInputType.number,
              controller: amount,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'Tanggal tidak terdaftar'
                          : 'Tanggal dipilih: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  TextButton(
                    onPressed: _presentDatePicker,
                    child: Text('Pilih tanggal'),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.purple),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              child: Text('Tambah Transaksi'),
              onPressed: _submitData,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
              ),
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
