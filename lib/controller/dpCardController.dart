import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DpCardController extends GetxController {
  var borderColor = Colors.transparent.obs;

  void changeBorderColor(Color color) {
    borderColor.value = color;
  }
}
