import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:xpenses_app/models/incomeModel.dart';
import 'package:xpenses_app/widgets/addIncomeWidget/addIncomeWidget.dart';

class IncomesScreenController extends GetxController {
  List<IncomeModel> movements = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  double totalIncome = 0;
  loadData() async {
    movements.clear();
    firestore
        .collection("Incomes")
        .where("date",
            isGreaterThan: Timestamp.fromDate(
                DateTime(DateTime.now().year, DateTime.now().month, 1)))
        .orderBy('date', descending: true)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
        var val = result.data()["Value"] ?? '0';
        val = double.tryParse(val.toString());
        movements.add(
            IncomeModel(description: result.data()["Description"], value: val));
      });
      calculateTotal();
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
        }).then((val) {
          movements.insert(0, value);
          calculateTotal();
          update();
        });
      }
    });
  }

  calculateTotal() {
    totalIncome = 0;
    movements.forEach((element) {
      totalIncome += element.value;
    });
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
}
