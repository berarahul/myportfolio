import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimationControllerGetX extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(); // Continuous rotation
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
