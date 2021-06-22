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
                    Card(
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
                                child: AutoSizeText('Incomes')),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
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
                                      'total Incomes',
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                    ),
                                    AutoSizeText(
                                      Money.from(controller.totalIncomes,
                                              controller.currency)
                                          .toString(),
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
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
                                      'current incomes',
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                    ),
                                    AutoSizeText(
                                      Money.from(controller.currentIncomes,
                                              controller.currency)
                                          .toString(),
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
                    ),
                    Card(
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
                                child: AutoSizeText('Expenses')),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
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
                                      'total expenses',
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                    ),
                                    AutoSizeText(
                                      "\$1500.00",
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
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
                                      'current expenses',
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                    ),
                                    AutoSizeText(
                                      "\$1000.00",
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
                    ),
                    Card(
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
                                child: AutoSizeText('Savings')),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
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
                                      'total Savings',
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                    ),
                                    AutoSizeText(
                                      "\$1500.00",
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
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
                                      'current savings',
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                    ),
                                    AutoSizeText(
                                      "\$1000.00",
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
                    ),
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
