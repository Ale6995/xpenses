import 'package:get/get.dart';
import 'package:xpenses_app/models/ExpensesModel.dart';

class ExpensesController extends GetxController {
  List<ExpenseModel> movements = [];

  addExpense(String description, double value, String category) {
    movements.add(ExpenseModel(
        description: description, value: value, category: category));
    update();
  }
}
