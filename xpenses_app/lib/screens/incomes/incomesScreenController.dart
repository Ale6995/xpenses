import 'package:get/get.dart';
import 'package:xpenses_app/models/incomeModel.dart';

class IncomesScreenController extends GetxController {
  List<IncomeModel> movements = [];

  addIncome(String description, double value) {
    movements.add(IncomeModel(description: description, value: value));
    update();
  }
}
