import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AboutDpController extends GetxController {
  // Observable for hover state
  var isHovered = false.obs;

  // Function to update the hover state
  void onHoverEnter() {
    isHovered.value = true;
  }

  void onHoverExit() {
    isHovered.value = false;
  }
}
