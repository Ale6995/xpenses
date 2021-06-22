import 'package:get/get.dart';
import 'package:money2/money2.dart';
import 'package:xpenses_app/screens/expenses/expensesController.dart';
import 'package:xpenses_app/screens/incomes/incomesScreenController.dart';

class GoalsController extends GetxController {
  ExpensesController expensesController = Get.find<ExpensesController>();

  IncomesScreenController incomesController =
      Get.find<IncomesScreenController>();

  double totalIncomes = 0;
  double currentIncomes = 0;
  double totalExpenses = 0;
  double currentExpenses = 0;
  double totalSavings = 0;
  double currentSavings = 0;

  Currency currency = Currency.create("\$", 2);
  calculateValues() {
    incomesController.addListener(() {
      if (this.totalIncomes != incomesController.totalIncome) {
        currentIncomes = incomesController.totalIncome;
        incomesController.allMovements
            .forEach((element) => this.totalIncomes += element.value);
        calculateSavings();
        update();
      }
    });
    expensesController.addListener(() {
      if (totalExpenses != expensesController.total) {
        currentExpenses = expensesController.total;
        expensesController.allMovements
            .forEach((element) => this.totalExpenses += element.value);
        calculateSavings();
        update();
      }
    });
  }

  calculateSavings() {
    totalSavings = totalIncomes - totalExpenses;
    currentSavings = currentIncomes - currentExpenses;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onReady
    super.onInit();
    calculateValues();
  }
}
