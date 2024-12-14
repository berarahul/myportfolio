import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShakeController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> shakeAnimation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true); // Shake animation loop

    shakeAnimation = Tween<double>(begin: -2.0, end: 2.0).animate(animationController);
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
