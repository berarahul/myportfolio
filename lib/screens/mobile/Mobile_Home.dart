import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/animation/shakeAnimation.dart';
import '../../controller/dpCardController.dart';
import '../../utils/constant/AppText.dart';
import '../../utils/constant/StringUrl.dart';
import '../../utils/constant/colors.dart';
import '../desktop/Desktop_Home.dart';

class MobileHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MobileContainer1(),
      ],
    );
  }
}

Widget MobileContainer1() {
  final ShakeController shakeController = Get.put(ShakeController());
  final DpCardController dpController = Get.put(DpCardController());

  return Container(
    color: AppColors.primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Column(
      children: [
        SizedBox(height: 10,),

        Container(
          height: 300,
          width: 200,
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
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 0),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.7),
                        spreadRadius: 3,
                        blurRadius: 10,
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
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.7),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(0, 0),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.7),
                        spreadRadius: 3,
                        blurRadius: 10,
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

        const SizedBox(height: 40),

        // Text Section
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.white12, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.7),
                spreadRadius: 2,
                blurRadius: 15,
                offset: Offset(0, 0),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                spreadRadius: 2,
                blurRadius: 15,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    fontSize: 15,
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
        const SizedBox(height: 40),

        // Social Media Icons Section
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: [
            socialMediaIcon(
                github, "https://github.com/berarahul", Colors.black),
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
            socialMediaIcon(
                youtube, "https://www.youtube.com/@CodeMasti27", Colors.red),
            socialMediaIcon(x, "https://x.com/MrRAHULBERA1", Colors.black),
          ],
        ),
      ],
    ),
  );
}
