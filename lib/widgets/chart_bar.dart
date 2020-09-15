import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double totalSpending;
  final double percentageOfTotal;

  ChartBar({this.label, this.totalSpending, this.percentageOfTotal});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, contraints) {
      return Column(
        children: <Widget>[
          Container(
            height: contraints.maxHeight * 0.15,
            child: FittedBox(
              child: Text('\$${totalSpending.toStringAsFixed(0)}'),
            ),
          ),
          SizedBox(
            height: contraints.maxHeight * 0.05,
          ),
          Container(
            width: 10,
            height: contraints.maxHeight * 0.6,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(20)),
                ),
                FractionallySizedBox(
                  heightFactor: percentageOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: contraints.maxHeight * 0.05,
          ),
          Container(
            height: contraints.maxHeight * 0.15,
            child: FittedBox(
              child: Text(label),
            ),
          ),
        ],
      );
    });
  }
}
