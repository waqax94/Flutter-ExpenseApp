import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransaction;
  final Function deleteTransaction;

  TransactionList(this.userTransaction, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: userTransaction.isEmpty
          ? LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    Text(
                      'No transaction added yet!',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/wait.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              },
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionItem(userTransaction: userTransaction[index], deleteTransaction: deleteTransaction);
              },
              itemCount: userTransaction.length,
            ),
    );
  }
}
