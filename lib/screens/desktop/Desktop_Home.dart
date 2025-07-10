import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:portfolio/screens/desktop/widgets/cloud.dart';
import 'package:portfolio/screens/desktop/widgets/teachStackIcon.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/utils/constant/AppText.dart';
import 'package:portfolio/utils/constant/StringUrl.dart';
import 'package:portfolio/utils/constant/colors.dart';

import '../../controller/animation/shakeAnimation.dart';
import '../../controller/dpCardController.dart';

class DesktopHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            DesktopContainer1(),
          ],
        ),
      ],
    );
  }
}

// DesktopContainer1 widget with text and social media icons inside separate containers
Widget DesktopContainer1() {
  final DpCardController dpController = Get.put(DpCardController()); // Register the controller

  return SingleChildScrollView(

    scrollDirection: Axis.vertical,
    child: Container(
      height: 560,
      color: AppColors.primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
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
                  height: 45,
                ),
                Stack(
                  children: [
                    // const Positioned.fill(child: BloodDripBackgroundPainter()), // 🔥 this is the animated blood layer
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
                            spreadRadius: 0.1,
                            blurRadius: 2,
                            color: Colors.white.withOpacity(0.7),
                            offset: const Offset(0, 0),
                          ),
                          BoxShadow(
                            spreadRadius: 0.1,
                            blurRadius: 2,
                            color: Colors.black.withOpacity(0.7),
                            offset: const Offset(0, 0),
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
                                colors: [Colors.white, Colors.white],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds);
                            },
                            child: Text(
                              "${AppText.bodyText1} 👋",
                              style: const TextStyle(
                                fontFamily: "Neuton-Extrabold",
                                color: Colors.white,
                                fontSize: 20,
                                height: 1.5,
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
                            totalRepeatCount: 1000000,
                            pause: const Duration(milliseconds: 500),
                            displayFullTextOnTap: true,
                            stopPauseOnTap: true,
                          ),
                        ],
                      ),
                    ),
                    // BloodDripBackgroundPainter(), // ✅ JUST THIS - rest untouched
                  ],
                )
,
                const SizedBox(height: 200),
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
          //         dpController.changeBorderColor(Colors.red); // Change border color to red
          //       },
          //       onExit: (_) {
          //         dpController.changeBorderColor(Colors.transparent); // Reset border color
          //       },
          //       child: FlipCard(
          //
          //         direction: FlipDirection.HORIZONTAL, // Flip horizontally or vertically
          //         front: Obx(() => Container(
          //           width: 300,
          //           height: 400,
          //
          //           decoration: BoxDecoration(
          //             gradient: const LinearGradient(
          //               colors: [Colors.black, Colors.white12],
          //               begin: Alignment.topCenter,
          //               end: Alignment.bottomCenter,
          //             ),
          //             borderRadius: BorderRadius.circular(16),
          //             boxShadow: [
          //               BoxShadow(
          //                 color: dpController.borderColor.value, // Observable border color
          //                 spreadRadius: 3,
          //                 blurRadius: 10,
          //                 offset: Offset(0, 0),
          //               ),
          //               BoxShadow(
          //                 color: Colors.black.withOpacity(0.7),
          //                 spreadRadius: 3,
          //                 blurRadius: 10,
          //                 offset: Offset(0, 0),
          //               ),
          //             ],
          //           ),
          //           child: ClipRRect(
          //             borderRadius: BorderRadius.circular(16),
          //             child: Image.asset(
          //               firstPic,
          //               fit: BoxFit.cover,
          //             ),
          //           ),
          //         )),
          //         back: Container(
          //           width: 300,
          //           height: 400,
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
          //                 spreadRadius: 3,
          //                 blurRadius: 10,
          //                 offset: const Offset(0, 0),
          //               ),
          //               BoxShadow(
          //                 color: Colors.black.withOpacity(0.7),
          //                 spreadRadius: 3,
          //                 blurRadius: 10,
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
          //                   fontSize: 20,
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
                    width: 300,
                    height: 400,
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
                    width: 300,
                    height: 400,
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
                            fontSize: 20,
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
                  height: 390,
                  width: 300,
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
                        spreadRadius: 0.1, // Spread radius for the glow
                        blurRadius: 2, // Softness of the glow
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
                      radius: 120,
                      defaultIconColor: Colors.white12,
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
                height: 17,
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