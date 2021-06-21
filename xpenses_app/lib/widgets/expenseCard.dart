import 'package:flutter/material.dart';

class ExpensesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("Housing: 1500"),
        leading: Icon(Icons.credit_card),
      ),
    );
  }
}
