import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.userTransaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction userTransaction;
  final Function deleteTransaction;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  var _bgColor;
  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.purple,
      Colors.blue,
      Colors.black,
    ];
    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\$${widget.userTransaction.ammount.toStringAsFixed(0)}',
              ),
            ),
          ),
        ),
        title: Text(
          '${widget.userTransaction.title}',
          style: Theme.of(context).textTheme.headline5,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.userTransaction.date),
          style: Theme.of(context).textTheme.headline6,
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                label: Text("Delete"),
                textColor: Theme.of(context).errorColor,
                onPressed: () {
                  widget.deleteTransaction(widget.userTransaction.id);
                },
              )
            : IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () {
                  widget.deleteTransaction(widget.userTransaction.id);
                },
              ),
      ),
    );
  }
}
