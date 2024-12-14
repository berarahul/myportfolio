// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package
// import '../../utils/constant/AppText.dart';
// import '../../utils/constant/colors.dart';
//
// class TabletContactView extends StatelessWidget {
//   const TabletContactView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ContactView(context), // Display the contact view
//       ],
//     );
//   }
// }
//
// Widget ContactView(BuildContext context) {
//   return Container(
//     color: AppColors.primaryColor,
//     height: 500, // Increased height for tablets
//     width: double.infinity,
//     child: Column(
//       children: [
//         const SizedBox(height: 10),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 16.0),
//           child: Text(
//             AppText.contactPageText1,
//             style: TextStyle(
//               color: AppColors.secondaryColor,
//               fontSize: 36, // Larger font for tablets
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8.0),
//           child: Text(
//             AppText.contactPageText2,
//             style: TextStyle(
//               color: AppColors.grayColor,
//               fontSize: 18, // Slightly larger font
//               fontWeight: FontWeight.bold,
//               fontFamily: "Poppins-ExtraLightItalic",
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//         Expanded(
//           child: Center(
//             child: Padding(
//               padding: EdgeInsets.all(24),
//               child: GridView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3, // Four columns for tablets
//                   mainAxisSpacing: 20,
//                   crossAxisSpacing: 20,
//                   childAspectRatio: 1.0,
//                 ),
//                 itemCount: Contacts.length,
//                 itemBuilder: (context, index) => SkillCard(
//                   contactName: Contacts[index]['name'],
//                   contactIcon: Contacts[index]['icon'],
//                   onTap: Contacts[index]['onTap'], // Pass the corresponding action
//                 ),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 30),
//         Text(
//           AppText.footer,
//           style: TextStyle(
//             color: AppColors.secondaryColor,
//             fontSize: 14,
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// // Stateless Widget for Skill Card with MouseRegion
// class SkillCard extends StatefulWidget {
//   final String contactName;
//   final IconData contactIcon;
//   final Function() onTap; // Function to handle tap
//
//   const SkillCard({
//     Key? key,
//     required this.contactName,
//     required this.contactIcon,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   State<SkillCard> createState() => _SkillCardState();
// }
//
// class _SkillCardState extends State<SkillCard> {
//   Color borderColor = Colors.transparent;
//
//   void _onHoverEnter(PointerEnterEvent event) {
//     setState(() {
//       borderColor = Colors.red;
//     });
//   }
//
//   void _onHoverExit(PointerExitEvent event) {
//     setState(() {
//       borderColor = Colors.transparent;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: _onHoverEnter,
//       onExit: _onHoverExit,
//       cursor: SystemMouseCursors.click,
//       child: GestureDetector(
//         onTap: widget.onTap, // Handle tap action
//         child: Card(
//           shape: RoundedRectangleBorder(
//             side: BorderSide(color: borderColor, width: 2),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           color: AppColors.grayColor,
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   widget.contactIcon,
//                   color: AppColors.secondaryColor,
//                   size: 50, // Slightly larger icons
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   widget.contactName,
//                   style: TextStyle(
//                     fontSize: 18, // Larger font for tablet
//                     color: AppColors.secondaryColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // Dummy Contacts List with Actions
// final List<Map<String, dynamic>> Contacts = [
//   {
//     'name': 'Email',
//     'icon': Icons.email,
//     'onTap': () => _launchEmail(),
//   },
//   {
//     'name': 'Phone',
//     'icon': Icons.phone,
//     'onTap': () => _launchWhatsApp('+8167226663'),
//   },
//   {
//     'name': 'Location',
//     'icon': Icons.location_on,
//     'onTap': () => _launchLocation(),
//   },
// ];
//
// // Functions for Specific Actions
// void _launchEmail() async {
//   const emailUrl = 'mailto:rb6764385@gmail.com'; // Replace with actual email
//   if (await canLaunchUrl(Uri.parse(emailUrl))) {
//     await launchUrl(Uri.parse(emailUrl));
//   } else {
//     throw 'Could not launch $emailUrl';
//   }
// }
//
// void _launchWhatsApp(String phoneNumber) async {
//   final whatsappUrl = 'https://wa.me/$phoneNumber'; // WhatsApp link
//   if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
//     await launchUrl(Uri.parse(whatsappUrl));
//   } else {
//     throw 'Could not launch $whatsappUrl';
//   }
// }
//
// void _launchLocation() async {
//   const locationUrl = 'https://maps.app.goo.gl/wMyuNwJfTCXG2JKu9'; // Replace with actual location
//   if (await canLaunchUrl(Uri.parse(locationUrl))) {
//     await launchUrl(Uri.parse(locationUrl));
//   } else {
//     throw 'Could not launch $locationUrl';
//   }
// }



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';  // Import url_launcher

import '../../controller/skillsController.dart';
import '../../utils/constant/AppText.dart';
import '../../utils/constant/colors.dart';
import '../../controller/contactController.dart';
import '../../utils/constant/iconsclass.dart';

class TabletContactView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ContactViewTablet(context),
        ),
      ],
    );
  }
}

Widget ContactViewTablet(BuildContext context) {
  return Container(
    color: AppColors.primaryColor,
    height: 500,
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
            style: TextStyle(color: AppColors.secondaryColor, fontSize: 40,

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
              spacing: 40, // Horizontal spacing between items
              runSpacing: 16, // Vertical spacing between rows
              alignment: WrapAlignment.center,
              children: contacts
                  .map((contact) => _buildContactCard(contact))
                  .toList(),
            ),
          ),
        ),
        SizedBox(height: 130,),
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
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 200,
          height: 200,
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
                spreadRadius: 3,
                blurRadius: 10,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                spreadRadius: 3,
                blurRadius: 10,
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
