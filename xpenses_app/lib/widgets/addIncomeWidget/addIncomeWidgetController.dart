import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpenses_app/models/incomeModel.dart';

class AddIncomeWidgetController extends GetxController {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController valueController = TextEditingController();

  close() {
    descriptionController.clear();
    valueController.clear();

    Get.back();
  }

  add() {
    Get.back(
        result: IncomeModel(
            description: descriptionController.text,
            value: double.parse(valueController.text),
            date: DateTime.now()));
    descriptionController.clear();
    valueController.clear();
  }
}
