import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:xpenses_app/models/incomeModel.dart';

class IncomeCard extends StatelessWidget {
  final IncomeModel income;

  const IncomeCard({
    Key? key,
    required this.income,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.black54, borderRadius: BorderRadius.circular(15)),
      child: AutoSizeText(
        income.description + ": \$ ${income.value}",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
