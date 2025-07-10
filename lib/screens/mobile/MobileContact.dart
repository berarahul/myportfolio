import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';  // Import url_launcher

import '../../controller/skillsController.dart';
import '../../utils/constant/AppText.dart';
import '../../utils/constant/colors.dart';
import '../../controller/contactController.dart';
import '../../utils/constant/iconsclass.dart';

class MobileContactView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ContactView(context),
        ),
      ],
    );
  }
}

Widget ContactView(BuildContext context) {
  return Container(
    color: AppColors.primaryColor,

    width: double.infinity,
    child: Column(
      children: [
        const SizedBox(
          height: 13,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            AppText.contactPageText1,
            style: TextStyle(color: AppColors.secondaryColor, fontSize: 30,

              fontFamily: "Neuton-Extrabold",
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            AppText.contactPageText2,
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
              children: contacts
                  .map((contact) => _buildContactCard(contact))
                  .toList(),
            ),
          ),
        ),
        SizedBox(height: 12,),
        Text(AppText.footer,style: TextStyle(color: AppColors.secondaryColor,
          fontFamily: "Neuton-Bold",
        ),)
      ],
    ),
  );
}

Widget _buildContactCard(Map<String, dynamic> contact) {
  final controller = Get.put(ContactController());
  final index = contacts.indexOf(contact);

  return Obx(() {
    final isHovered = controller.hoveredIndex.value == index; // Reactive hover check
    return MouseRegion(
      cursor: SystemMouseCursors.click, // Set hand cursor on hover
      onEnter: (_) => controller.hoveredIndex.value = index, // Update hovered index
      onExit: (_) => controller.hoveredIndex.value = -1, // Reset hovered index
      child: GestureDetector(
        onTap: contact['onTap'],  // Trigger onTap function for each contact
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.black, Colors.white12],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              color: Colors.grey[900],
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
                color: isHovered ? Colors.red : Colors.transparent, // Border change on hover
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  contact['icon'], // Asset path for the image
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 12),
                Text(
                  contact['name'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 14,

                    fontFamily: "Neuton-Extrabold",
                  ),
                ),
              ],
            ),
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

// Contact List with Actions
final List<Map<String, dynamic>> contacts = [
  {
    'name': 'Email',
    'icon': icons.email,
    'onTap': () => _launchEmail(),
  },
  {
    'name': 'Phone',
    'icon': icons.phone,
    'onTap': () => _launchWhatsApp('+8167226663'),
  },
  {
    'name': 'Location',
    'icon': icons.locatiion,
    'onTap': () => _launchLocation(),
  },
];

// Functions for Specific Actions
void _launchEmail() async {
  const emailUrl = 'mailto:rb6764385@gmail.com';
  if (await canLaunch(emailUrl)) {
    await launch(emailUrl);
  } else {
    throw 'Could not launch $emailUrl';
  }
}

void _launchWhatsApp(String phoneNumber) async {
  final whatsappUrl = 'https://wa.me/$phoneNumber';
  if (await canLaunch(whatsappUrl)) {
    await launch(whatsappUrl);
  } else {
    throw 'Could not launch $whatsappUrl';
  }
}

void _launchLocation() async {
  const locationUrl = 'https://maps.app.goo.gl/wMyuNwJfTCXG2JKu9';
  if (await canLaunch(locationUrl)) {
    await launch(locationUrl);
  } else {
    throw 'Could not launch $locationUrl';
  }
}
