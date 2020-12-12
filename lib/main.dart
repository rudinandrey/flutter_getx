import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_test1/MyController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  MyController controller = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Obx(() => Text(controller.param.value)),
            RaisedButton(
              onPressed: () {
                Get.to(ParamChangePage());
              },
              child: Text("Go add param page"),
            )
          ],
        ),
      ),
    );
  }
}

class ParamChangePage extends StatelessWidget {
  final MyController controller = Get.put(MyController());
  final TextEditingController param = TextEditingController();
  @override
  Widget build(BuildContext context) {
    param.text = controller.param.value;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: param,
              ),
              RaisedButton(
                onPressed: () {
                  controller.setParam(param.text);
                  Get.back();
                },
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
