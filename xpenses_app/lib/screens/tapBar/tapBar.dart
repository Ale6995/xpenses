import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpenses_app/screens/expenses/expenses.dart';
import 'package:xpenses_app/screens/incomes/incomesScreen.dart';

import 'package:xpenses_app/screens/tapBar/tapbarController.dart';

class MyTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyTabController _tabx = Get.put(MyTabController());
    // ↑ init tab controller

    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: ListTile(
            title: Text("Xpenses"),
            leading: Image.asset(
              'images/logo.png',
              width: 42,
            ),
          ),
        ),
        backgroundColor: Colors.blue[100],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
            color: Colors.grey[500],
            child: GetBuilder<MyTabController>(
              builder: (controller) => TabBar(
                onTap: (value) => _tabx.update(),
                controller: _tabx.controller,
                tabs: [
                  Tab(
                    text: 'Expenses',
                    iconMargin: EdgeInsets.all(1),
                    icon: Container(
                        child: Image.asset(
                      _tabx.controller.index == 0
                          ? 'images/expensesOn.png'
                          : 'images/expensesOff.png',
                      height: 35,
                    )),
                  ),
                  Tab(
                    text: 'Incomes',
                    iconMargin: EdgeInsets.all(1),
                    icon: Container(
                        child: Image.asset(
                      _tabx.controller.index == 1
                          ? 'images/incomesOn.png'
                          : 'images/incomesOff.png',
                      height: 35,
                    )),
                  ),
                  Tab(
                    text: 'Goals',
                    iconMargin: EdgeInsets.all(1),
                    icon: Container(
                        child: Image.asset(
                      _tabx.controller.index == 2
                          ? 'images/savingOn.png'
                          : 'images/savingsOff.png',
                      height: 35,
                    )),
                  )
                ],
              ),
            )),
      ),
      body: TabBarView(
        controller: _tabx.controller,
        children: [
          Expenses(),
          IncomesScreen(),
          Center(
            child: Text(
              'no Body yet for this tab',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 36),
            ),
          )
        ],
      ),
    );
  }
}
