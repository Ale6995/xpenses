import 'package:get/get.dart';
import 'package:xpenses_app/models/incomeModel.dart';
import 'package:xpenses_app/widgets/addIncomeWidget/addIncomeWidget.dart';

class IncomesScreenController extends GetxController {
  List<IncomeModel> movements = [];

  addIncome(String description, double value) {
    Get.dialog(AddIncomeWidget()).then((value) {
      if (value != null) movements.add(value);
      update();
    });
  }
}
