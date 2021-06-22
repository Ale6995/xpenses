import 'package:cloud_firestore/cloud_firestore.dart';

class IncomeModel {
  final String description;
  final double value;
  final Timestamp date;

  const IncomeModel({
    required this.description,
    required this.date,
    required this.value,
  }) : super();
}
