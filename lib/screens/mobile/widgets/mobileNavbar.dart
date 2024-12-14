import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/navigationController.dart';

class MobileNavbar extends StatelessWidget {
  final NavigationController navController = Get.find();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Responsive Navbar"),
      actions: [
        PopupMenuButton<int>(
          onSelected: navController.navigateTo,
          itemBuilder: (context) => [
            const PopupMenuItem(value: 0, child: Text("Home")),
            const PopupMenuItem(value: 1, child: Text("About")),
            const PopupMenuItem(value: 2, child: Text("Services")),
            const PopupMenuItem(value: 3, child: Text("Projects")),
            const PopupMenuItem(value: 4, child: Text("Contact")),
          ],
        ),
      ],
    );
  }
}
