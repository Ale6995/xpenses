import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpenses_app/screens/incomes/incomesScreen.dart';
import 'package:xpenses_app/screens/tapBar/tapbarController.dart';

class MyTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyTabController _tabx = Get.put(MyTabController());
    // ↑ init tab controller

    return Scaffold(
      appBar: AppBar(
        title: Text("Xpenses"),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.grey[500],
          child: TabBar(
            controller: _tabx.controller,
            tabs: _tabx.myTabs,
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabx.controller,
        children: _tabx.myTabs.map((Tab tab) {
          final String label = tab.text!.toLowerCase();
          switch (label) {
            case 'incomes':
              return IncomesScreen();
            case 'expenses':
              return Container();
            default:
              return Center(
                child: Text(
                  'This is the $label tab',
                  style: const TextStyle(fontSize: 36),
                ),
              );
          }
        }).toList(),
      ),
    );
  }
}
