// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../../utils/constant/AppText.dart';
// import '../../utils/constant/StringUrl.dart';
// import '../../utils/constant/colors.dart';
// import '../../utils/constant/styels.dart';
//
// class DesktopAbout extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: DesktopContainer2(context),
//         ),
//       ],
//     );
//   }
// }
//
// Widget DesktopContainer2(BuildContext context) {
//   final RxInt hoveredItem = (-1).obs;
//   Future<void> openResume(BuildContext context) async {
//     const resumeUrl =
//         "https://docs.google.com/document/d/1kbM15G1TIO6avGSk_9vgC16FYOuCHXkXi1LhfpfSLCQ/edit?tab=t.0";
//
//     try {
//       // Check if the URL can be launched
//       if (await canLaunchUrl(Uri.parse(resumeUrl))) {
//         // Launch the URL in the web browser
//         await launchUrl(Uri.parse(resumeUrl),
//             mode: LaunchMode.externalApplication);
//       } else {
//         // Show error message if URL can't be launched
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Could not open the resume URL.")),
//         );
//       }
//     } catch (e) {
//       // Handle exceptions
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Failed to open resume: $e")),
//       );
//     }
//   }
//
//   return Container(
//     color: AppColors.primaryColor,
//     width: double.infinity,
//     child: SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const SizedBox(height: 100),
//           // Main Heading
//           Text(
//             AppText.aboutBodyText1,
//             style: TextStyle(
//               fontFamily: "Neuton-Extrabold",
//               fontSize: 40,
//               color: AppColors.secondaryColor,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           // Subheading
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Text(
//               AppText.aboutBodyText2,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontFamily: "Neuton-Bold",
//                 fontSize: 15,
//                 color: AppColors.grayColor,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           const SizedBox(height: 30),
//           // Image and Description Section
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Image.asset(
//                   aboutPic,
//                   // width: 200,
//                   height: 500,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Description Heading
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20, top: 20),
//                       child: Text(
//                         AppText.aboutBodyText3, // Example "My Journey"
//                         style: TextStyle(
//                           fontFamily: "Neuton-Extrabold",
//                           color: AppColors.redColor,
//                           fontSize: 23,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     // Sub-descriptions
//                     Padding(
//                       padding: const EdgeInsets.only(left: 23, right: 50),
//                       child: Text(
//                         AppText.aboutBodyText4,
//                         // Example "I am a Flutter developer..."
//                         style: TextStyle(
//                           fontFamily: "PlayfairDisplayItalicVariableFont",
//                           color: AppColors.secondaryColor,
//                           fontSize: 15,
//                         ),
//                         textAlign: TextAlign.justify,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 23, right: 50),
//                       child: Text(
//                         AppText.aboutBodyText5, // Additional text
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontFamily: "PlayfairDisplayItalicVariableFont",
//                           color: AppColors.grayColor,
//                           fontSize: 15,
//                         ),
//                         textAlign: TextAlign.justify,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     // Horizontal Divider
//                     Padding(
//                       padding: const EdgeInsets.only(left: 23, right: 50),
//                       child: Divider(
//                         thickness: 2,
//                         color: AppColors.grayColor,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     // Call-to-Action or Highlighted Text
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Text(
//                         AppText.aboutBodyText6,
//                         // "Contact Me / Find Out More"
//                         style: TextStyle(
//                           fontFamily: "Neuton-Extrabold",
//                           color: AppColors.redColor,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         textAlign: TextAlign.justify,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 23, right: 50),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             AppText.aboutBodyText7,
//                             style: TextStyle(
//                                 color: AppColors.secondaryColor,
//                                 fontFamily: "Neuton-Bold"),
//                           ),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           Text(AppText.aboutBodyText8,
//                               style: TextStyle(
//                                   color: AppColors.secondaryColor,
//                                   fontFamily: "Neuton-Bold")),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           Text(AppText.aboutBodyText9,
//                               style: TextStyle(
//                                   color: AppColors.secondaryColor,
//                                   fontFamily: "Neuton-Bold")),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           Text(AppText.aboutBodyText10,
//                               style: TextStyle(
//                                   color: AppColors.secondaryColor,
//                                   fontFamily: "Neuton-Bold")),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           Text(AppText.aboutBodyText11,
//                               style: TextStyle(
//                                   color: AppColors.secondaryColor,
//                                   fontFamily: "Neuton-Bold")),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           Text(AppText.aboutBodyText12,
//                               style: TextStyle(
//                                   color: AppColors.secondaryColor,
//                                   fontFamily: "Neuton-Bold")),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           Text(AppText.aboutBodyText13,
//                               style: TextStyle(
//                                   color: AppColors.secondaryColor,
//                                   fontFamily: "Neuton-Bold")),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           Text(AppText.aboutBodyText14,
//                               style: TextStyle(
//                                   color: AppColors.secondaryColor,
//                                   fontFamily: "Neuton-Bold")),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           Text(AppText.postgreSql,
//                               style: TextStyle(
//                                   color: AppColors.secondaryColor,
//                                   fontFamily: "Neuton-Bold")),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           Text(AppText.mongoDB,
//                               style: TextStyle(
//                                   color: AppColors.secondaryColor,
//                                   fontFamily: "Neuton-Bold")),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           Text(AppText.nodeJs,
//                               style: TextStyle(
//                                   color: AppColors.secondaryColor,
//                                   fontFamily: "Neuton-Bold")),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           Text(AppText.postman,
//                               style: TextStyle(
//                                   color: AppColors.secondaryColor,
//                                   fontFamily: "Neuton-Bold")),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           Text(AppText.docker,
//                               style: TextStyle(
//                                   color: AppColors.secondaryColor,
//                                   fontFamily: "Neuton-Bold")),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           Text(AppText.ApiIntegration,
//                               style: TextStyle(
//                                   color: AppColors.secondaryColor,
//                                   fontFamily: "Neuton-Bold")),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           Text(AppText.supaBase,
//                               style: TextStyle(
//                                   color: AppColors.secondaryColor,
//                                   fontFamily: "Neuton-Bold")),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 23, right: 50),
//                       child: Divider(
//                         thickness: 2,
//                         color: AppColors.grayColor,
//                       ),
//                     ),
//
//                     //____________________________________________________________________________________________________________//
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           flex: 1,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 23),
//                                 child: RichText(
//                                   text: TextSpan(
//                                     children: [
//                                       TextSpan(
//                                         text: "${AppText.aboutBodyText15} ",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontFamily: "Neuton-Extrabold",
//                                             color: AppColors.grayColor,
//                                             fontSize: 16),
//                                       ),
//                                       TextSpan(
//                                         text: AppText.aboutBodyText16,
//                                         style: TextStyle(
//                                             fontFamily: "Neuton-Bold",
//                                             color: AppColors.secondaryColor,
//                                             fontSize: 16),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 23),
//                                 child: RichText(
//                                   text: TextSpan(
//                                     children: [
//                                       TextSpan(
//                                         text: "${AppText.aboutBodyText19} ",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontFamily: "Neuton-Extrabold",
//                                             color: AppColors.grayColor,
//                                             fontSize: 16),
//                                       ),
//                                       TextSpan(
//                                         text: AppText.aboutBodyText20,
//                                         style: TextStyle(
//                                             fontFamily: "Neuton-Bold",
//                                             color: AppColors.secondaryColor,
//                                             fontSize: 16),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 15,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: MouseRegion(
//                                   onEnter: (_) {
//                                     hoveredItem.value =
//                                         5; // Set hover state for the Resume button
//                                   },
//                                   onExit: (_) {
//                                     hoveredItem.value = -1; // Reset hover state
//                                   },
//                                   child: Obx(() => AnimatedContainer(
//                                         duration:
//                                             const Duration(milliseconds: 200),
//                                         transform: hoveredItem.value == 5
//                                             ? Matrix4.translationValues(5, 0,
//                                                 0) // Horizontal shake animation
//                                             : Matrix4.identity(),
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                         ),
//                                         child: ElevatedButton(
//                                           onPressed: () {
//                                             openResume(
//                                                 context); // Open the resume
//                                           },
//                                           style: borderedButtonStyle.copyWith(
//                                             backgroundColor:
//                                                 MaterialStateProperty.all(
//                                               hoveredItem.value == 5
//                                                   ? Colors.red
//                                                   : AppColors.primaryColor,
//                                             ),
//                                           ),
//                                           child: Text(
//                                             AppText.navaBarText6,
//                                             style: TextStyle(
//                                               fontFamily: "Neuton-Bold",
//                                               color: hoveredItem.value == 5
//                                                   ? AppColors.secondaryColor
//                                                   : AppColors.grayColor,
//                                             ),
//                                           ),
//                                         ),
//                                       )),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const Spacer(
//                           flex: 1,
//                         ),
//                         Expanded(
//                           flex: 1,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 50),
//                                 child: RichText(
//                                   text: TextSpan(
//                                     children: [
//                                       TextSpan(
//                                         text: "${AppText.aboutBodyText17} ",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontFamily: "Neuton-Extrabold",
//                                             color: AppColors.grayColor,
//                                             fontSize: 16),
//                                       ),
//                                       TextSpan(
//                                         text: AppText.aboutBodyText18,
//                                         style: TextStyle(
//                                             fontFamily: "Neuton-Bold",
//                                             color: AppColors.secondaryColor,
//                                             fontSize: 16),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 50),
//                                 child: RichText(
//                                   text: TextSpan(
//                                     children: [
//                                       TextSpan(
//                                         text: "${AppText.aboutBodyText21} ",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontFamily: "Neuton-Extrabold",
//                                             color: AppColors.grayColor,
//                                             fontSize: 16),
//                                       ),
//                                       TextSpan(
//                                         text: AppText.aboutBodyText22,
//                                         style: TextStyle(
//                                             fontFamily: "Neuton-Bold",
//                                             color: AppColors.secondaryColor,
//                                             fontSize: 16),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           // Bottom Divider
//         ],
//       ),
//     ),
//   );
// }




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/constant/AppText.dart';
import '../../utils/constant/StringUrl.dart';
import '../../utils/constant/colors.dart';
import '../../utils/constant/styels.dart';

class DesktopAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DesktopContainer2(context),
        ),
      ],
    );
  }
}

Widget DesktopContainer2(BuildContext context) {
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

  final textStyle = TextStyle(
    color: AppColors.secondaryColor,
    fontFamily: "Neuton-Bold",
  );

  return Container(
    color: AppColors.primaryColor,
    width: double.infinity,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          Text(
            AppText.aboutBodyText1,
            style: TextStyle(
              fontFamily: "Neuton-Extrabold",
              fontSize: 40,
              color: AppColors.secondaryColor,
            ),
            textAlign: TextAlign.center,
          ),
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  aboutPic,
                  height: 500,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sectionHeading(AppText.aboutBodyText3),
                    sectionText(AppText.aboutBodyText4),
                    sectionText(AppText.aboutBodyText5, bold: true),
                    horizontalDivider(),
                    sectionHeading(AppText.aboutBodyText6),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final text in [
                            AppText.aboutBodyText7,
                            AppText.aboutBodyText8,
                            AppText.aboutBodyText9,
                            AppText.aboutBodyText10,
                            AppText.aboutBodyText11,
                            AppText.aboutBodyText12,
                            AppText.aboutBodyText13,
                            AppText.aboutBodyText14,
                            AppText.postgreSql,
                            AppText.mongoDB,
                            AppText.nodeJs,
                            AppText.postman,
                            AppText.docker,
                            AppText.ApiIntegration,
                            AppText.supaBase,
                          ])
                            Text(text, style: textStyle),
                        ],
                      ),
                    ),
                    horizontalDivider(),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: buildRichTextSection(
                            AppText.aboutBodyText15,
                            AppText.aboutBodyText16,
                            hoveredItem,
                            context,
                            openResume,
                          ),
                        ),
                        const Spacer(flex: 1),
                        Expanded(
                          flex: 1,
                          child: buildInfoColumn(
                            AppText.aboutBodyText17,
                            AppText.aboutBodyText18,
                            AppText.aboutBodyText21,
                            AppText.aboutBodyText22,
                          ),
                        ),
                      ],
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

// Helper widgets
Widget sectionHeading(String text) => Padding(
  padding: const EdgeInsets.only(left: 20, top: 20),
  child: Text(
    text,
    style: TextStyle(
      fontFamily: "Neuton-Extrabold",
      color: AppColors.redColor,
      fontSize: 23,
      fontWeight: FontWeight.bold,
    ),
  ),
);

Widget sectionText(String text, {bool bold = false}) => Padding(
  padding: const EdgeInsets.only(left: 23, right: 50),
  child: Text(
    text,
    style: TextStyle(
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      fontFamily: "PlayfairDisplayItalicVariableFont",
      color: bold ? AppColors.grayColor : AppColors.secondaryColor,
      fontSize: 15,
    ),
    textAlign: TextAlign.justify,
  ),
);

Widget horizontalDivider() => Padding(
  padding: const EdgeInsets.only(left: 23, right: 50, top: 10, bottom: 10),
  child: Divider(thickness: 2, color: AppColors.grayColor),
);

Widget buildRichTextSection(
    String title1,
    String subtitle1,
    RxInt hoveredItem,
    BuildContext context,
    Function(BuildContext) openResume,
    ) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 23),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$title1 ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Neuton-Extrabold",
                    color: AppColors.grayColor,
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: subtitle1,
                  style: TextStyle(
                    fontFamily: "Neuton-Bold",
                    color: AppColors.secondaryColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MouseRegion(
            onEnter: (_) => hoveredItem.value = 5,
            onExit: (_) => hoveredItem.value = -1,
            child: Obx(
                  () => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform: hoveredItem.value == 5
                    ? Matrix4.translationValues(5, 0, 0)
                    : Matrix4.identity(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: () => openResume(context),
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
              ),
            ),
          ),
        ),
      ],
    );

Widget buildInfoColumn(
    String title1,
    String subtitle1,
    String title2,
    String subtitle2,
    ) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 50),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$title1 ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Neuton-Extrabold",
                    color: AppColors.grayColor,
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: subtitle1,
                  style: TextStyle(
                    fontFamily: "Neuton-Bold",
                    color: AppColors.secondaryColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(right: 50),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$title2 ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Neuton-Extrabold",
                    color: AppColors.grayColor,
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: subtitle2,
                  style: TextStyle(
                    fontFamily: "Neuton-Bold",
                    color: AppColors.secondaryColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
