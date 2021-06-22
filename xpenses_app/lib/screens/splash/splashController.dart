import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:xpenses_app/screens/expenses/expensesController.dart';
import 'package:xpenses_app/screens/goals/goalsController.dart';
import 'package:xpenses_app/screens/incomes/incomesScreenController.dart';
import 'package:xpenses_app/screens/tapBar/tapBar.dart';

class SplashController extends GetxController {
  IncomesScreenController incomesController =
      Get.put(IncomesScreenController());
  ExpensesController expensesController = Get.put(ExpensesController());
  GoalsController goalsController = Get.put(GoalsController());

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    ensureInit();
  }

  ensureInit() {
    if (incomesController.ready != null) {
      Get.off(() => MyTabBar());
    } else {
      Future.delayed(Duration(seconds: 1), () {
        ensureInit();
      });
    }
  }
}
