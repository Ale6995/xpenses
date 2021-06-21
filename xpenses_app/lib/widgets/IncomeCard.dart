import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:money2/money2.dart';
import 'package:xpenses_app/models/incomeModel.dart';

class IncomeCard extends StatelessWidget {
  final IncomeModel income;

  const IncomeCard({
    Key? key,
    required this.income,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[100],
      child: ListTile(
        title: Text(income.description +
            ": " +
            Money.from(income.value, Currency.create('\$ ', 2)).toString()),
        leading: Icon(Icons.account_balance),
      ),
    );
  }
}
