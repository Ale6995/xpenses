import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xpenses_app/widgets/addIncomeWidget/addIncomeWidgetController.dart';

class AddIncomeWidget extends StatelessWidget {
  AddIncomeWidgetController controller = Get.put(AddIncomeWidgetController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddIncomeWidgetController>(builder: (controller) {
      return Dialog(
        child: Container(
          alignment: Alignment.center,
          height: 300,
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20),
                child: AutoSizeText(
                  "Add Income",
                  maxFontSize: 30,
                  minFontSize: 16,
                ),
              ),
              Container(
                child: Form(
                    child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.all(15),
                        child: TextField(
                          decoration: InputDecoration(
                              isDense: true,
                              border: OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.black)),
                              labelText: 'Description',
                              labelStyle: TextStyle(color: Colors.blueGrey)),
                          controller: controller.descriptionController,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              isDense: true,
                              border: OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.black)),
                              labelText: 'value',
                              labelStyle: TextStyle(color: Colors.blueGrey)),
                          controller: controller.valueController,
                        ),
                      )
                    ],
                  ),
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blueGrey),
                      ),
                      onPressed: () => controller.close(),
                      child: Text("Close"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.lightBlueAccent),
                      ),
                      onPressed: () => controller.add(),
                      child: Text("Add"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
