import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/widgets/ResponsiveAllPagesforAlldevices.dart';
import 'widgets/navbar.dart';
import 'controller/navigationController.dart';

void main() {
  // Initialize the NavigationController
  Get.put(NavigationController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Navbar(), // Use MobileNavbar or Navbar based on constraints
        ),
        body: ResponsiveAllPagesForAllDevices(),
      ),
    );
  }
}
