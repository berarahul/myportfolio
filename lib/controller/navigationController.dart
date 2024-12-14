import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  RxInt currentIndex = 0.obs;
  final ScrollController scrollController = ScrollController();

  final List<double> sectionOffsets = [
    0.0,    // Home
    600.0,  // About
    1200.0, // Services
    1800.0, // Projects
    2400.0, // Contact
  ];

  void navigateTo(int index) {
    currentIndex.value = index;
    scrollController.animateTo(
      sectionOffsets[index],
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
