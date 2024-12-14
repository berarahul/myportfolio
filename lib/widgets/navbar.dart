import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/utils/constant/AppText.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controller/navigationController.dart';
import '../utils/constant/colors.dart';
import '../utils/constant/styels.dart';

class Navbar extends StatelessWidget {
  final NavigationController navController = Get.find<NavigationController>();

  final RxInt hoveredItem =
      (-1).obs; // Initial hover state is -1 (none hovered)

  @override
  Widget build(BuildContext context) {
    Future<void> openResume(BuildContext context) async {
      const resumeUrl =
          "https://docs.google.com/document/d/1kbM15G1TIO6avGSk_9vgC16FYOuCHXkXi1LhfpfSLCQ/edit?tab=t.0";

      try {
        // Check if the URL can be launched
        if (await canLaunchUrl(Uri.parse(resumeUrl))) {
          // Launch the URL in the web browser
          await launchUrl(Uri.parse(resumeUrl),
              mode: LaunchMode.externalApplication);
        } else {
          // Show error message if URL can't be launched
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Could not open the resume URL.")),
          );
        }
      } catch (e) {
        // Handle exceptions
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to open resume: $e")),
        );
      }
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 1024 ) {
          // Mobile View: Use a Menu Icon
          return AppBar(
            backgroundColor: AppColors.primaryColor,
            title: Text(
              AppText.navaBarText1,

              style: TextStyle(color: AppColors.secondaryColor,

                fontFamily: "Neuton-Bold",
              ),
            ),
            actions: [
              IconButton(
                color: AppColors.secondaryColor,
                icon: const Icon(Icons.menu),
                onPressed: () {
                  showMenuDialog(context);
                },
              ),
            ],
          );
        } else {
          // Tablet/Desktop View: Show all items in the Navbar
          return AppBar(
            backgroundColor: AppColors.primaryColor,
            title: Text(
              AppText.navaBarText1,
              style: TextStyle(color: AppColors.grayColor, fontSize: 15,  fontFamily: "Neuton-Bold",),
            ),
            actions: [
              TextButton(
                onPressed: () => navController.navigateTo(0),
                child: MouseRegion(
                  onEnter: (_) {
                    hoveredItem.value = 0;
                  },
                  onExit: (_) {
                    hoveredItem.value = -1;
                  },
                  child: Obx(() => Text(
                        'Home',
                        style: TextStyle(
                          fontFamily: "Neuton-Bold",
                          color: hoveredItem.value == 0
                              ? Colors.red
                              : AppColors.grayColor,
                        ),
                      )),
                ),
              ),
              TextButton(
                onPressed: () => navController.navigateTo(1),
                child: MouseRegion(
                  onEnter: (_) {
                    hoveredItem.value = 1;
                  },
                  onExit: (_) {
                    hoveredItem.value = -1;
                  },
                  child: Obx(() => Text(
                        'About',
                        style: TextStyle(
                          fontFamily: "Neuton-Bold",
                          color: hoveredItem.value == 1
                              ? Colors.red
                              : AppColors.grayColor,
                        ),
                      )),
                ),
              ),
              TextButton(
                onPressed: () => navController.navigateTo(2),
                child: MouseRegion(
                  onEnter: (_) {
                    hoveredItem.value = 2;
                  },
                  onExit: (_) {
                    hoveredItem.value = -1;
                  },
                  child: Obx(() => Text(
                        'Services',
                        style: TextStyle(
                          fontFamily: "Neuton-Bold",
                          color: hoveredItem.value == 2
                              ? Colors.red
                              : AppColors.grayColor,
                        ),
                      )),
                ),
              ),
              TextButton(
                onPressed: () => navController.navigateTo(3),
                child: MouseRegion(
                  onEnter: (_) {
                    hoveredItem.value = 3;
                  },
                  onExit: (_) {
                    hoveredItem.value = -1;
                  },
                  child: Obx(() => Text(
                        'Projects',
                        style: TextStyle(
                          fontFamily: "Neuton-Bold",
                          color: hoveredItem.value == 3
                              ? Colors.red
                              : AppColors.grayColor,
                        ),
                      )),
                ),
              ),
              TextButton(
                onPressed: () => navController.navigateTo(4),
                child: MouseRegion(
                  onEnter: (_) {
                    hoveredItem.value = 4;
                  },
                  onExit: (_) {
                    hoveredItem.value = -1;
                  },
                  child: Obx(() => Text(
                        'Contact',
                        style: TextStyle(
                          fontFamily: "Neuton-Bold",
                          color: hoveredItem.value == 4
                              ? Colors.red
                              : AppColors.grayColor,
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MouseRegion(
                  onEnter: (_) {
                    hoveredItem.value =
                        5; // Set hover state for the Resume button
                  },
                  onExit: (_) {
                    hoveredItem.value = -1; // Reset hover state
                  },
                  child: Obx(() => AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        transform: hoveredItem.value == 5
                            ? Matrix4.translationValues(
                                5, 0, 0) // Horizontal shake animation
                            : Matrix4.identity(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            openResume(context); // Open the resume
                          },
                          style: borderedButtonStyle.copyWith(
                            backgroundColor: MaterialStateProperty.all(
                              hoveredItem.value == 5
                                  ? Colors.red
                                  : AppColors.primaryColor,
                            ),
                          ),
                          child: Text(
                            AppText.navaBarText6,
                            style: TextStyle(
                              fontFamily: "Neuton-Bold",
                              color: hoveredItem.value == 5
                                  ? AppColors.secondaryColor
                                  : AppColors.grayColor,
                            ),
                          ),
                        ),
                      )),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  // Menu Dialog for Mobile View
  void showMenuDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: AppColors.primaryColor,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(color: AppColors.secondaryColor,
                    fontFamily: "Neuton-Bold",
                  ),
                ),
                onTap: () {
                  navController.navigateTo(0);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text(
                  'About',
                  style: TextStyle(color: AppColors.secondaryColor,
                    fontFamily: "Neuton-Bold",
                  ),
                ),
                onTap: () {
                  navController.navigateTo(1);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text(
                  'Services',
                  style: TextStyle(color: AppColors.secondaryColor,

                    fontFamily: "Neuton-Bold",
                  ),
                ),
                onTap: () {
                  navController.navigateTo(2);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text(
                  'Projects',
                  style: TextStyle(color: AppColors.secondaryColor,
                    fontFamily: "Neuton-Bold",
                  ),
                ),
                onTap: () {
                  navController.navigateTo(3);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text(
                  'Contact',
                  style: TextStyle(color: AppColors.secondaryColor,
                    fontFamily: "Neuton-Bold",
                  ),
                ),
                onTap: () {
                  navController.navigateTo(4);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
