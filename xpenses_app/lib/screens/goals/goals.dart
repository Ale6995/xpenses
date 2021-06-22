import 'package:fl_chart/fl_chart.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money2/money2.dart';
import 'package:xpenses_app/screens/goals/goalsController.dart';

class GoalsScreen extends StatelessWidget {
  GoalsController controller = Get.find<GoalsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<GoalsController>(
        builder: (controller) => Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 220,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(color: Color(0xFFdbdbd9), boxShadow: [
                  BoxShadow(
                      color: Colors.black38, blurRadius: 8, spreadRadius: 8)
                ]),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SummaryCard(
                        tittle: "Incomes",
                        total: controller.totalIncomes,
                        current: controller.currentIncomes),
                    SummaryCard(
                        tittle: "Expenses",
                        total: controller.totalExpenses,
                        current: controller.currentExpenses),
                    SummaryCard(
                        tittle: "Savings",
                        total: controller.totalSavings,
                        current: controller.currentSavings)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final double total;
  final double current;
  final String tittle;
  const SummaryCard(
      {Key? key,
      required this.tittle,
      required this.total,
      required this.current})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: 140,
        // padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                height: 35,
                margin: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                child: AutoSizeText(tittle)),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue[100]!,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    AutoSizeText(
                      'total ' + tittle.toLowerCase(),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    AutoSizeText(
                      Money.from(total, Currency.create("\$", 2)).toString(),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue[100]!,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    AutoSizeText(
                      'current ' + tittle.toLowerCase(),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    AutoSizeText(
                      Money.from(current, Currency.create("\$", 2)).toString(),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
