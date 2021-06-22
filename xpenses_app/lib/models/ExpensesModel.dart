import 'package:cloud_firestore/cloud_firestore.dart';

class ExpenseModel {
  final String description;
  final double value;
  final String category;
  final Timestamp date;

  const ExpenseModel(
      {required this.description,
      required this.value,
      required this.category,
      required this.date})
      : super();
}
