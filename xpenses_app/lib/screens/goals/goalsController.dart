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
  Currency currency = Currency.create("\$", 2);
  calculateIncomes() {
    incomesController.addListener(() {
      if (this.totalIncomes != incomesController.totalIncome) {
        currentIncomes = incomesController.totalIncome;
        incomesController.allMovements
            .forEach((element) => this.totalIncomes += element.value);
        print("goalsincome: " + incomesController.totalIncome.toString());
        update();
      }
    });
  }

  calculate() {
    totalExpenses = expensesController.total;
    expensesController.allMovements
        .forEach((element) => this.totalExpenses += element.value);
    update();
  }

  @override
  void onInit() {
    // TODO: implement onReady
    super.onInit();
    calculateIncomes();
  }
}
