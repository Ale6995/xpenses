import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:xpenses_app/screens/incomes/incomesScreenController.dart';
import 'package:xpenses_app/widgets/IncomeCard.dart';

class IncomesScreen extends StatelessWidget {
  IncomesScreenController controller = Get.put(IncomesScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<IncomesScreenController>(
        builder: (controller) => Container(
            child: controller.movements.length == 0
                ? Container(
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      "No incomes reported",
                      style: TextStyle(color: Colors.grey[800], fontSize: 30),
                    ),
                  )
                : ListView.builder(
                    itemCount: controller.movements.length,
                    itemBuilder: (context, index) {
                      return IncomeCard(
                        income: controller.movements[index],
                      );
                    })),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addIncome();
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.grey[500],
      ),
    );
  }
}
