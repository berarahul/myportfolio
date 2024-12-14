import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/animation/aboutdpController.dart';
import '../../controller/dpCardController.dart';
import '../../utils/constant/AppText.dart';
import '../../utils/constant/StringUrl.dart';
import '../../utils/constant/colors.dart';
import '../../utils/constant/styels.dart';

class MobileAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileAboutContainer2(context);
  }
}

Widget MobileAboutContainer2(BuildContext context) {
  final AboutDpController aboutDpController = Get.put(AboutDpController());

  final RxInt hoveredItem = (-1).obs;

  Future<void> openResume(BuildContext context) async {
    const resumeUrl =
        "https://docs.google.com/document/d/1kbM15G1TIO6avGSk_9vgC16FYOuCHXkXi1LhfpfSLCQ/edit?tab=t.0";

    try {
      if (await canLaunchUrl(Uri.parse(resumeUrl))) {
        await launchUrl(Uri.parse(resumeUrl),
            mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Could not open the resume URL.")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to open resume: $e")),
      );
    }
  }

  return Container(
    color: AppColors.primaryColor,
    width: double.infinity,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          // Main Heading
          Text(
            AppText.aboutBodyText1,
            style: TextStyle(
              fontFamily: "Neuton-Extrabold",
              fontSize: 30,
              color: AppColors.secondaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          // Subheading
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              AppText.aboutBodyText2,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "Neuton-Bold",
                fontSize: 15,
                color: AppColors.grayColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          MouseRegion(
            onEnter: (_) => aboutDpController.onHoverEnter(), // On hover enter
            onExit: (_) => aboutDpController.onHoverExit(),
            child: Obx(() {
              return CircleAvatar(
                radius: 120,
                backgroundColor: Colors.transparent,
                // Set to transparent to avoid any background color
                backgroundImage: AssetImage(mobileaboutpic),
                // Your image path
                child: Align(
                  alignment: Alignment(0.0, 1.9),
                  // Moves the image further down inside the CircleAvatar
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: aboutDpController.isHovered.value ? Colors.red : Colors.transparent,
                        // Change border color on hover
                        width: 1, // Adjust the border width as needed
                      ),
                      shape: BoxShape.circle, // Keep the shape as circle
                    ),
                  ), // Empty container to hold the alignment properties
                ),
              );
            }),
          ),


          Text(
            AppText.aboutBodyText3, // Example "My Journey"
            style: TextStyle(
              fontFamily: "Neuton-Extrabold",
              color: AppColors.redColor,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(
            height: 5,
          ),
          // Sub-descriptions
          Padding(
            padding: const EdgeInsets.only(left: 23, right: 12),
            child: Text(
              AppText.aboutBodyText4,
              // Example "I am a Flutter developer..."
              style: TextStyle(
                fontFamily: "PlayfairDisplayItalicVariableFont",
                color: AppColors.secondaryColor,
                fontSize: 15,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 23, right: 12),
            child: Text(
              AppText.aboutBodyText5, // Additional text
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "PlayfairDisplayItalicVariableFont",
                color: AppColors.grayColor,
                fontSize: 15,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(
            height: 5,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 23, right: 12),
            child: Divider(
              thickness: 2,
              color: AppColors.grayColor,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          // Call-to-Action or Highlighted Text
          Text(
            AppText.aboutBodyText6,
            style: TextStyle(
              fontFamily: "Neuton-Extrabold",
              color: AppColors.redColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.justify,
          ),

          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                AppText.aboutBodyText7,
                style: TextStyle(
                    color: AppColors.secondaryColor, fontFamily: "Neuton-Bold"),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(AppText.aboutBodyText8,
                  style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontFamily: "Neuton-Bold")),
              const SizedBox(
                width: 5,
              ),
              Text(AppText.aboutBodyText9,
                  style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontFamily: "Neuton-Bold")),
              const SizedBox(
                width: 5,
              ),
              Text(AppText.aboutBodyText10,
                  style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontFamily: "Neuton-Bold")),
              const SizedBox(
                width: 5,
              ),
              Text(AppText.aboutBodyText11,
                  style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontFamily: "Neuton-Bold")),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 23, right: 12),
            child: Divider(
              thickness: 2,
              color: AppColors.grayColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 23),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${AppText.aboutBodyText15} ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Neuton-Extrabold",
                                  color: AppColors.grayColor,
                                  fontSize: 16),
                            ),
                            TextSpan(
                              text: AppText.aboutBodyText16,
                              style: TextStyle(
                                  fontFamily: "Neuton-Bold",
                                  color: AppColors.secondaryColor,
                                  fontSize: 16),
                            ),
                          ],


                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 23),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${AppText.aboutBodyText17} ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Neuton-Extrabold",
                                  color: AppColors.grayColor,
                                  fontSize: 16),
                            ),
                            TextSpan(
                              text: AppText.aboutBodyText18,
                              style: TextStyle(
                                  fontFamily: "Neuton-Bold",
                                  color: AppColors.secondaryColor,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 23),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${AppText.aboutBodyText19} ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Neuton-Extrabold",
                                  color: AppColors.grayColor,
                                  fontSize: 16),
                            ),
                            TextSpan(
                              text: AppText.aboutBodyText20,
                              style: TextStyle(
                                  fontFamily: "Neuton-Bold",
                                  color: AppColors.secondaryColor,
                                  fontSize: 16),
                            ),

                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 23),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${AppText.aboutBodyText21} ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Neuton-Extrabold",
                                  color: AppColors.grayColor,
                                  fontSize: 16),
                            ),
                            TextSpan(
                              text: AppText.aboutBodyText22,
                              style: TextStyle(
                                  fontFamily: "Neuton-Bold",
                                  color: AppColors.secondaryColor,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),


                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
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
                                child: Obx(() =>
                                    AnimatedContainer(
                                      duration: const Duration(
                                          milliseconds: 200),
                                      transform: hoveredItem.value == 5
                                          ? Matrix4.translationValues(
                                          5, 0, 0) // Horizontal shake animation
                                          : Matrix4.identity(),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          openResume(
                                              context); // Open the resume
                                        },
                                        style: borderedButtonStyle.copyWith(
                                          backgroundColor: MaterialStateProperty
                                              .all(
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
                        ),
                      ),
                    ),
                  ],
                ),

              ),


            ],

          ),
        ],
      ),
    ),
  );
}
