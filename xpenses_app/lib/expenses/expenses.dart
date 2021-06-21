import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpenses_app/screens/tapBar/tapbarController.dart';
import 'package:xpenses_app/widgets/expenseCard.dart';

class Expenses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ExpensesCard(),
        ExpensesCard(),
        ExpensesCard(),
      ],
    );
  }
}
