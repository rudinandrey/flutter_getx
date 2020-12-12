import 'package:get/get.dart';

class MyController extends GetxController {
  RxString param = "".obs;

  void setParam(String value) {
    param.value = value;
  }
}
