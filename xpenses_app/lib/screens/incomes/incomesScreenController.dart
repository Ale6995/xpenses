import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:xpenses_app/models/incomeModel.dart';
import 'package:xpenses_app/widgets/addIncomeWidget/addIncomeWidget.dart';

class IncomesScreenController extends GetxController {
  List<IncomeModel> movements = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  loadData() async {
    movements.clear();
    firestore.collection("Incomes").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
        var val = result.data()["Value"] ?? '0';
        val = double.tryParse(val.toString());
        movements.add(
            IncomeModel(description: result.data()["Description"], value: val));
      });
      update();
    });
  }

  addIncome() {
    Get.dialog(AddIncomeWidget()).then((value) {
      if (value != null) {
        firestore.collection("Incomes").add({
          "Description": value.description,
          "Value": value.value,
          "date": DateTime.now(),
        }).then((value) {
          loadData();
        });
      }
    });
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
}
