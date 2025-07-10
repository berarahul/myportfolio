// import 'package:flutter/material.dart';
// import 'package:portfolio/utils/constant/AppText.dart';
// import 'package:portfolio/utils/constant/StringUrl.dart';
// import 'package:portfolio/utils/constant/colors.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class TabletHome extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           TabletContainer1(),
//         ],
//       ),
//     );
//   }
// }
//
// Widget TabletContainer1() {
//   return Container(
//     color: AppColors.primaryColor,
//     padding: const EdgeInsets.symmetric(horizontal: 20),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         // Picture Section
//         Container(
//           width: double.infinity,
//           child: Image.asset(
//             firstPic,
//             fit: BoxFit.contain,
//             height: 300, // Fixed height for tablet
//           ),
//         ),
//         const SizedBox(height: 20),
//
//         // Text Section
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               AppText.bodyText1,
//               style: const TextStyle(
//                 fontFamily: "Poppins-ExtraLightItalic",
//                 color: Colors.grey,
//                 fontSize: 18, // Increased font size for better visibility
//                 height: 1.5,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               AppText.bodyText2,
//               style: const TextStyle(
//                 fontFamily: "horror3",
//                 fontSize: 20, // Increased font size for tablets
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               AppText.bodyText3,
//               style: const TextStyle(
//                 fontFamily: "Poppins-ExtraLightItalic",
//                 fontSize: 18, // Increased font size for tablets
//                 color: Colors.grey,
//               ),
//             ),
//             const SizedBox(height: 20),
//
//             // Social Media Icons
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Wrap(
//                 spacing: 10, // Increased spacing for tablet layout
//                 runSpacing: 10,
//                 children: [
//                   socialMediaIcon(github, "https://github.com/berarahul"),
//                   socialMediaIcon(linkedin, "https://www.linkedin.com/in/rahul-bera-a4aa65268/"),
//                   socialMediaIcon(facebook, "https://www.facebook.com/profile.php?id=100027514122155"),
//                   socialMediaIcon(instagram, "https://www.instagram.com/mr.rahul8037/?hl=en"),
//                   socialMediaIcon(youtube, "https://www.youtube.com/@CodeMasti27"),
//                   socialMediaIcon(x, "https://x.com/MrRAHULBERA1"),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
//
// // Helper method to create hoverable and clickable social media icons
// Widget socialMediaIcon(String iconPath, String url) {
//   final ValueNotifier<bool> isHovered = ValueNotifier(false);
//
//   return MouseRegion(
//     cursor: SystemMouseCursors.click,
//     onEnter: (_) {
//       isHovered.value = true;
//     },
//     onExit: (_) {
//       isHovered.value = false;
//     },
//     child: GestureDetector(
//       onTap: () async {
//         if (await canLaunchUrl(Uri.parse(url))) {
//           await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
//         }
//       },
//       child: ValueListenableBuilder<bool>(
//         valueListenable: isHovered,
//         builder: (context, hovered, child) {
//           return Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: hovered ? Colors.red : Colors.grey,
//             ),
//             padding: const EdgeInsets.all(5),
//             child: Image.asset(
//               iconPath,
//               height: 30,
//               color: hovered ? Colors.white : null,
//             ),
//           );
//         },
//       ),
//     ),
//   );
// }



import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/dpCardController.dart';
import '../../utils/constant/AppText.dart';
import '../../utils/constant/StringUrl.dart';
import '../../utils/constant/colors.dart';
import '../desktop/Desktop_Home.dart';
import '../desktop/widgets/cloud.dart';
import '../desktop/widgets/teachStackIcon.dart';

class TabletHome extends StatelessWidget {
   TabletHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
     child:  Column(
        children: [

          TabletHomeView()
        ],
      ),
    );
  }

  @override
  Widget TabletHomeView(){
    final DpCardController dpController = Get.put(DpCardController()); // Register the controller

    return SingleChildScrollView(
  scrollDirection: Axis.vertical,
  child: Container(
     height: 550,
    color: AppColors.primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Left Section: Text Container with Gradient Background and Glow Border
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container for text
              const SizedBox(
                height:  120,
              ),
              Container(

                padding: const EdgeInsets.all(30),
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
                      offset: Offset(0, 0),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      spreadRadius: 0.1,
                      blurRadius: 2,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: [
                            Colors.white,
                            Colors.white
                          ], // Gradient colors  // child: Text(

                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds);
                      },
                      child: Text(
                        "${AppText.bodyText1} 👋", // String interpolation ke liye ${variableName} ka use karte hain
                        style:  TextStyle(
                          fontFamily: "Neuton-Extrabold",
                          color: Colors.white, // Set a color (won't be visible but required)
                          fontSize: 15,
                          // height: 1.5,
                        ),
                      ),

                    ),
                    const SizedBox(height: 10),
                    Text(
                      AppText.bodyText2,
                      style: TextStyle(
                        fontFamily: "Neuton-Extrabold",

                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Text(
                    //   AppText.bodyText3,
                    //   style: TextStyle(
                    //     fontFamily: "Poppins-ExtraLightItalic",
                    //     fontSize: 20,
                    //     color: AppColors.secondaryColor,
                    //   ),
                    // ),
                    AnimatedTextKit(
                      animatedTexts: [
                        ...textList.map(
                              (text) => TyperAnimatedText(
                            text,
                            textStyle: TextStyle(
                              fontFamily: "Neuton-Extrabold",
                              fontSize: 15,
                              color: AppColors.secondaryColor,
                            ),
                            speed: const Duration(milliseconds: 80),
                          ),
                        ),
                      ],
                      totalRepeatCount: 1000000, // Animation will play once
                      pause: const Duration(milliseconds: 500), // Pause before next animation
                      displayFullTextOnTap: true, // Show full text on tap
                      stopPauseOnTap: true, // Continue animation on tap
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
              // Container for Social Media Icons
              Expanded(
                child: Container(
                  child: Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    children: [
                      socialMediaIcon(github, "https://github.com/berarahul",
                          Colors.black),
                      socialMediaIcon(
                          linkedin,
                          "https://www.linkedin.com/in/rahul-bera-a4aa65268/",
                          Colors.blue),
                      socialMediaIcon(
                          facebook,
                          "https://www.facebook.com/profile.php?id=100027514122155",
                          Colors.blue),
                      socialMediaIcon(
                          instagram,
                          "https://www.instagram.com/mr.rahul8037/?hl=en",
                          Colors.pink),
                      socialMediaIcon(youtube,
                          "https://www.youtube.com/@CodeMasti27", Colors.red),
                      socialMediaIcon(
                          x, "https://x.com/MrRAHULBERA1", Colors.black),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Expanded(
        //
        //   flex: 3,
        //   child: Center(
        //     child: MouseRegion(
        //       cursor: SystemMouseCursors.click,
        //       onEnter: (_) {
        //
        //         dpController.changeBorderColor(Colors.redAccent); // Change border color to red
        //       },
        //       onExit: (_) {
        //         dpController.changeBorderColor(Colors.transparent); // Reset border color
        //       },
        //       child: FlipCard(
        //
        //         direction: FlipDirection.HORIZONTAL, // Flip horizontally or vertically
        //         front: Obx(() => Container(
        //           width: 210,
        //           height: 300,
        //
        //           decoration: BoxDecoration(
        //             gradient: const LinearGradient(
        //               colors: [Colors.black, Colors.white12],
        //               begin: Alignment.topCenter,
        //               end: Alignment.bottomCenter,
        //             ),
        //             borderRadius: BorderRadius.circular(5),
        //             boxShadow: [
        //               BoxShadow(
        //
        //                 color: dpController.borderColor.value, // Observable border color
        //                 spreadRadius: 5,
        //                 blurRadius: 15,
        //                 offset: Offset(0, 0),
        //               ),
        //               BoxShadow(
        //                 color: Colors.black.withOpacity(0.7),
        //                 spreadRadius: 5,
        //                 blurRadius: 15,
        //                 offset: Offset(0, 0),
        //               ),
        //             ],
        //           ),
        //           child: ClipRRect(
        //             borderRadius: BorderRadius.circular(5),
        //             child: Image.asset(
        //               firstPic,
        //               fit: BoxFit.cover,
        //             ),
        //           ),
        //         )),
        //         back: Container(
        //           width: 210,
        //           height: 300,
        //           decoration: BoxDecoration(
        //             gradient: const LinearGradient(
        //               colors: [Colors.white12, Colors.black],
        //               begin: Alignment.topCenter,
        //               end: Alignment.bottomCenter,
        //             ),
        //             borderRadius: BorderRadius.circular(5),
        //             boxShadow: [
        //               BoxShadow(
        //                 color: Colors.white.withOpacity(0.7),
        //                 spreadRadius: 5,
        //                 blurRadius: 15,
        //                 offset: const Offset(0, 0),
        //               ),
        //               BoxShadow(
        //                 color: Colors.black.withOpacity(0.7),
        //                 spreadRadius: 5,
        //                 blurRadius: 15,
        //                 offset: const Offset(0, 0),
        //               ),
        //             ],
        //           ),
        //           child: Center(
        //             child: Padding(
        //               padding: const EdgeInsets.symmetric(horizontal: 16),
        //               child: Text(
        //                 AppText.motivationQuote,
        //                 style: const TextStyle(
        //                   color: Colors.white,
        //                   fontSize: 15,
        //                   fontWeight: FontWeight.bold,
        //                   fontFamily: "Neuton-Bold",
        //                 ),
        //                 textAlign: TextAlign.center,
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),


        Expanded(
          flex: 3,
          child: Center(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) {
                dpController.changeBorderColor(Colors.red); // Change border color to red on hover
              },
              onExit: (_) {
                dpController.changeBorderColor(Colors.transparent); // Reset border color when hover ends
              },
              child: FlipCard(
                direction: FlipDirection.HORIZONTAL, // Flip horizontally or vertically
                front: Obx(() => Container(
                  width: 210,
                  height: 300,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.white12, Colors.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    // Apply Border.all on hover only
                    border: dpController.borderColor.value == Colors.transparent
                        ? Border() // No border initially
                        : Border.all( // Apply border with color when hovered
                      color: dpController.borderColor.value,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: dpController.borderColor.value, // Observable border color for shadow
                        spreadRadius: 0.1,
                        blurRadius: 2,
                        offset: Offset(0, 0),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.7),
                        spreadRadius: 0.1,
                        blurRadius: 2,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      firstPic,
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
                back: Container(
                  width: 210,
                  height: 300,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.white12, Colors.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.7),
                        spreadRadius: 0.1,
                        blurRadius: 2,
                        offset: const Offset(0, 0),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.7),
                        spreadRadius: 0.1,
                        blurRadius: 2,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        AppText.motivationQuote,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Neuton-Bold",
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),


        Expanded(
          flex: 2, // Space reserved for GlobeOfLogos
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 1),
              child: Container(
                height: 300,
                width: 210,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.white12, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(16), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.7), // White glow
                      spreadRadius: 0.1,
                      blurRadius: 2,// Softness of the glow
                      offset: const Offset(0, 0), // Centered glow
                    ),
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.7), // Black shadow for depth
                      spreadRadius: 0.1,
                      blurRadius: 2,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Padding inside the container
                  child: GlobeOfLogos(

                    icons: TechStackIcons
                        .getAllIcons(), // Replace with your actual icon list
                    radius: 72,
                    defaultIconColor: Colors.white70,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ),

  ),
);
  }

// Social Media Icon Widget
  Widget socialMediaIcon(String iconPath, String url, Color hoverColor) {
    final ValueNotifier<bool> isHovered = ValueNotifier(false);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        isHovered.value = true;
      },
      onExit: (_) {
        isHovered.value = false;
      },
      child: GestureDetector(
        onTap: () async {
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
          }
        },
        child: ValueListenableBuilder<bool>(
          valueListenable: isHovered,
          builder: (context, hovered, child) {
            return AnimatedScale(
              scale: hovered ? 1.3 : 1.0, // Scale the icon to 1.3x when hovered
              duration: const Duration(
                  milliseconds: 200), // Smooth duration for the scaling
              curve: Curves.easeInOut, // Smooth curve for scaling animation
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: hovered ? hoverColor : Colors.grey,
                ),
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  iconPath,
                  height: 21,
                  color: hovered ? Colors.white : null,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  final List<String> textList = [
    // "Let's build something amazing together!"

    "Flutter Developer",
    "UI/UX Designer",
    "Content Creator",
    "Technical Writer"
  ];
}

