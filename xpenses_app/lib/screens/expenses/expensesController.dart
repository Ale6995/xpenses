import 'package:get/get.dart';
import 'package:xpenses_app/models/ExpensesModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xpenses_app/widgets/addExpenseWidget/AddExpenseWidget.dart';

class ExpensesController extends GetxController {
  List<ExpenseModel> movements = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  loadData() async {
    movements.clear();
    firestore.collection("Expenses").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
        var val = result.data()["Value"] ?? '0';
        val = double.tryParse(val.toString());
        movements.add(ExpenseModel(
            description: result.data()["Description"],
            value: val,
            category: result.data()["Category"]));
      });
      update();
    });
  }

  addExpense() {
    Get.dialog(AddExpenseWidget()).then((value) {
      if (value != null) {
        firestore.collection("Expenses").add({
          "Description": value.description,
          "Value": value.value,
          "Category": value.category,
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
