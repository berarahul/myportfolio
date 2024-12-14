import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/screens/mobile/MobileAbout.dart';
import 'package:portfolio/screens/mobile/Mobile_Home.dart';
import '../controller/navigationController.dart';
import '../screens/desktop/DesktopAbout.dart';
import '../screens/desktop/DesktopProjects.dart';
import '../screens/desktop/DesktopServices.dart';
import '../screens/desktop/Desktop_Home.dart';
import '../screens/desktop/contactDesktop.dart';
import '../screens/mobile/MobileContact.dart';
import '../screens/mobile/MobileProjects.dart';
import '../screens/mobile/MobileServices.dart';
import '../screens/tablet/TabProjects.dart';
import '../screens/tablet/Tablet_Home.dart';
import '../screens/tablet/aboutTablet.dart';
import '../screens/tablet/tabServices.dart';
import '../screens/tablet/tabletContact.dart';

class ResponsiveAllPagesForAllDevices extends StatelessWidget {
  final NavigationController navController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 800) {
            // Mobile Layout
            return buildResponsiveLayout(isMobile: true);
          } else if (constraints.maxWidth < 1024) {
            // Tablet Layout
            return buildResponsiveLayout(isTablet: true);
          } else {
            // Desktop Layout
            return buildResponsiveLayout(isDesktop: true);
          }
        },
      ),
    );
  }

  Widget buildResponsiveLayout({
    bool isMobile = false,
    bool isTablet = false,
    bool isDesktop = false,
  }) {
    return SingleChildScrollView(
      controller: navController.scrollController,
      child: Column(

        children: [
          if (isMobile) ...[


            MobileHome(), // Use Mobile Home layout
            MobileAbout(),
            Mobileservices(),
             MobileProjects(),
             MobileContactView()

          ] else if (isTablet) ...[
            // SectionWidget(title: "Home (Tablet)", color: Colors.orange),
            // SectionWidget(title: "About (Tablet)", color: Colors.blue),
            TabletHome(),
            TabletAbout(),
             TabletServiceView(),
             TabProjectsView(),
             TabletContactView(),


          ] else if (isDesktop) ...[
            DesktopHome(),
            DesktopAbout(),
            DesktopService(),
            DesktopProjects(),
            DesktopContactView(),
          ],
          // SectionWidget(title: "Services", color: Colors.pink),
          // SectionWidget(title: "Projects", color: Colors.cyan),
          // SectionWidget(title: "Contact", color: Colors.lime),
        ],
      ),
    );
  }
}
