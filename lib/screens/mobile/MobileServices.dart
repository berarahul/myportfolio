import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../controller/servicesController.dart';
import '../../controller/skillsController.dart';
import '../../utils/constant/AppText.dart';
import '../../utils/constant/colors.dart';
import '../../utils/constant/iconsclass.dart';

class Mobileservices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ServiceMobileView(context),
        ),
      ],
    );
  }
}

Widget ServiceMobileView(BuildContext context) {
  return Container(
    color: AppColors.primaryColor,

    width: double.infinity,
    child: Column(
      children: [
        const SizedBox(
          height: 13,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            AppText.servicePageText1,
            style: TextStyle(color: AppColors.secondaryColor, fontSize: 30,

              fontFamily: "Neuton-Extrabold",
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            AppText.servicePageText2,
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
              spacing: 16, // Horizontal spacing between items
              runSpacing: 16, // Vertical spacing between rows
              alignment: WrapAlignment.center,
              children: skills.map((skill) => _buildSkillCardWrap(skill))
                  .toList(),
            ),
          ),
        ),

      ],
    ),
  );
}
//


Widget _buildSkillCardWrap(Map<String, dynamic> skill) {
  final controller = Get.put(ServicesController());
  final index = skills.indexOf(skill);

  return


    Obx(() {
      final isHovered = controller.hoveredIndex.value == index; // Reactive hover check

      return MouseRegion(
        cursor: SystemMouseCursors.click, // Set hand cursor on hover
        onEnter: (_) => controller.hoveredIndex.value = index, // Update hovered index
        onExit: (_) => controller.hoveredIndex.value = -1,
        child: FlipCard(
          direction: FlipDirection.HORIZONTAL, // Flip horizontally
          front: Container(
            width: 200,
            height: 200,
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
                  spreadRadius: 0.1,
                  blurRadius: 2,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.7),
                  spreadRadius: 0.1,
                  blurRadius: 2,
                ),
              ],
              border: Border.all(
                color: isHovered ? Colors.red : Colors.transparent,
                // Border change on hover
                width: 2,
              ),
            ),
            child: Center(
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
          back: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.white12, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.7),
                  spreadRadius: 0.1,
                  blurRadius: 2,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.7),
                  spreadRadius: 0.1,
                  blurRadius: 2,
                ),
              ],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  skill['quote'], // Display the unique motivational quote
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: "Neuton-Bold",
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
}

// Sample Data with image paths
final List<Map<String, dynamic>> skills = [
  {
    'title': 'Mobile Development',
    'icon': icons.appLogo,
    'quote': "Turning ideas into apps is not just coding, it's crafting the future in the palm of your hand."
  },
  {
    'title': 'UI/UX Design',
    'icon': icons.UIUX,
    'quote': "Design is not just what it looks like; it's how it feels. Craft experiences that inspire and delight."
  },
  {
    'title': 'Technical Writing',
    'icon': icons.TecnicalWritingLogo,
    'quote': "Transform complexity into clarity—your words can bridge the gap between ideas and understanding."
  },
  {
    'title': 'Open Source - GitHub',
    'icon': icons.opensource,
    'quote': "Empower the world with code—contribute, collaborate, and create a legacy through open source."
  },
];



