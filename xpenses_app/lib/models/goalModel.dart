import 'package:cloud_firestore/cloud_firestore.dart';

class GoalModel {
  final String description;
  final double value;
  final DateTime date;

  const GoalModel({
    required this.description,
    required this.date,
    required this.value,
  }) : super();
}
