import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/utils/constant/iconsclass.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/skillsController.dart';
import '../../utils/constant/AppText.dart';
import '../../utils/constant/colors.dart';

class DesktopProjects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ProjectDesktopView(context),  // desktopview
        ),
      ],
    );
  }
}

Widget ProjectDesktopView(BuildContext context) {
  return Container(
    color: AppColors.primaryColor,
    height: 500,
    width: double.infinity,
    child: Column(
      children: [
        const SizedBox(
          height: 35,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            AppText.projectsPageText1,
            style: TextStyle(color: AppColors.secondaryColor, fontSize: 40,
              fontFamily: "Neuton-Extrabold",
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            AppText.projectsPageText2,
            style: TextStyle(
              color: AppColors.grayColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Neuton-Bold",
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Enable horizontal scrolling
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 50, // Horizontal spacing between items
              runSpacing: 16, // Vertical spacing between rows
              alignment: WrapAlignment.center,
              children: skills
                  .map((skill) => _buildSkillCardWrap(skill))
                  .toList(),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildSkillCardWrap(Map<String, dynamic> skill) {
  final controller = Get.put(SkillsController());
  final index = skills.indexOf(skill);

  return Obx(() {
    final isHovered = controller.hoveredIndex.value == index; // Reactive hover check
    return MouseRegion(
      cursor: SystemMouseCursors.click, // Set hand cursor on hover
      onEnter: (_) => controller.hoveredIndex.value = index, // Update hovered index
      onExit: (_) => controller.hoveredIndex.value = -1, // Reset hovered index
      child: GestureDetector(
        onTap: () {
          _launchURL(skill['url']); // Navigate to project source
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.black, Colors.white12],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.7),
                spreadRadius: 3,
                blurRadius: 10,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                spreadRadius: 3,
                blurRadius: 10,
              ),
            ],
            color: Colors.grey[900],
            // borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isHovered ? Colors.red : Colors.transparent, // Border change on hover
              width: 2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                skill['icon'], // Asset path for the image
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 12),
              Text(
                skill['title']!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 14,
                  fontFamily: "Neuton-Extrabold",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  });
}

// Function to launch URL
void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

// Sample Data
final List<Map<String, dynamic>> skills = [
  {'title': 'Student Attendance Management System', 'icon': icons.attendance, 'url': 'https://github.com/berarahul/TeacherApp'},
  {'title': 'Food Delivery App', 'icon': icons.foodApp, 'url': 'https://github.com/berarahul/WavesOffoodApp'},
  {'title': 'Weather Application', 'icon': icons.weatherApp, 'url': 'https://github.com/berarahul/weatherApp'},
];
