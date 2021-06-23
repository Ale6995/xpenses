import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:xpenses_app/screens/expenses/expensesController.dart';
import 'package:xpenses_app/screens/goals/goalsController.dart';
import 'package:xpenses_app/screens/incomes/incomesScreenController.dart';
import 'package:xpenses_app/screens/tapBar/tapBar.dart';
import 'package:local_auth/local_auth.dart';

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

  static Future<bool> authenticateWithBiometrics() async {
    final LocalAuthentication localAuthentication = LocalAuthentication();
    bool isBiometricSupported = await localAuthentication.isDeviceSupported();
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    bool isAuthenticated = false;

    if (isBiometricSupported && canCheckBiometrics) {
      isAuthenticated = await localAuthentication.authenticate(
        localizedReason: 'Please complete the biometrics to proceed.',
        biometricOnly: true,
      );
    }

    return isAuthenticated;
  }

  ensureInit() async {
    authenticateWithBiometrics();
    var auth = await authenticateWithBiometrics();
    if (incomesController.ready != null && auth) {
      Get.off(() => MyTabBar());
    } else {
      Future.delayed(Duration(seconds: 1), () {
        ensureInit();
      });
    }
  }
}
