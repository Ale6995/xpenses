import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpenses_app/screens/expenses/expensesController.dart';
import 'package:xpenses_app/widgets/expenseCard.dart';

class Expenses extends StatelessWidget {
  ExpensesController controller = Get.put(ExpensesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ExpensesController>(
        builder: (controller) => Container(
            child: controller.movements.length == 0
                ? Container(
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      "No expenses reported",
                      style: TextStyle(color: Colors.grey[800], fontSize: 30),
                    ),
                  )
                : ListView.builder(
                    itemCount: controller.movements.length,
                    itemBuilder: (context, index) {
                      return ExpensesCard(
                        expense: controller.movements[index],
                      );
                    })),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addExpense("hola", 1000.0, 'housing');
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.grey[500],
      ),
    );
  }
}
