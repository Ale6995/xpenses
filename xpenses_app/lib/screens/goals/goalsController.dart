import 'package:get/get.dart';
import 'package:money2/money2.dart';
import 'package:xpenses_app/models/goalModel.dart';
import 'package:xpenses_app/screens/expenses/expensesController.dart';
import 'package:xpenses_app/screens/goals/goals.dart';
import 'package:xpenses_app/screens/incomes/incomesScreenController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GoalsController extends GetxController {
  GoalModel? ourGoal;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  ExpensesController expensesController = Get.find<ExpensesController>();
  IncomesScreenController incomesController =
      Get.find<IncomesScreenController>();

  double totalIncomes = 0;
  double currentIncomes = 0;
  double totalExpenses = 0;
  double currentExpenses = 0;
  double totalSavings = 0;
  double currentSavings = 0;
  double savingsDays = 0;
  loadData() async {
    firestore
        .collection("Goals")
        .orderBy('date', descending: true)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.docs[0].data().isNotEmpty) {
        ourGoal = GoalModel(
            description: querySnapshot.docs[0].data()['description'],
            date: querySnapshot.docs[0].data()['date'],
            value: querySnapshot.docs[0].data()['value']);
      }
      ;
      savinsPerDay();
      update();
    });
  }

  savinsPerDay() {
    int daysUntilGoalFinish = ourGoal!.date.difference(DateTime.now()).inDays;
    savingsDays = (ourGoal!.value - totalSavings) / daysUntilGoalFinish;
  }

  Currency currency = Currency.create("\$", 2);
  calculateValues() {
    incomesController.addListener(() {
      if (this.totalIncomes != incomesController.totalIncome) {
        currentIncomes = incomesController.totalIncome;
        totalIncomes = 0;
        incomesController.allMovements
            .forEach((element) => this.totalIncomes += element.value);
        savinsPerDay();
        calculateSavings();
        update();
      }
    });
    expensesController.addListener(() {
      if (totalExpenses != expensesController.total) {
        currentExpenses = expensesController.total;
        totalExpenses = 0;
        expensesController.allMovements
            .forEach((element) => this.totalExpenses += element.value);
        savinsPerDay();
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
    super.onInit();
    calculateValues();
  }
}
