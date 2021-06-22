import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpenses_app/models/ExpensesModel.dart';
import 'package:xpenses_app/models/categoriesModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddExpenseWidgetController extends GetxController {
  List<CategoryModel> expenceCategories = [];
  TextEditingController descriptionController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String? value;
  close() {
    descriptionController.clear();
    valueController.clear();

    Get.back();
  }

  add() {
    Get.back(
        result: ExpenseModel(
            description: descriptionController.text,
            category: value!,
            value: double.parse(valueController.text)));
    descriptionController.clear();
    valueController.clear();
  }

  saveDropDownValue(String? value) {
    this.value = value;
    update();
  }

  loadcategories() {
    expenceCategories.clear();
    firestore.collection("ExpenseCategories").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
        var val = result.data()["Value"] ?? '0';
        val = double.tryParse(val.toString());
        expenceCategories.add(CategoryModel(
            alert: result.data()["Alert"],
            category: result.data()["Category"]));
        update();
      });
    });
  }

  @override
  void onInit() {
    super.onInit();
    loadcategories();
  }
}
