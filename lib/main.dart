import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/widgets/ResponsiveAllPagesforAlldevices.dart';
import 'widgets/navbar.dart';
import 'controller/navigationController.dart';

void main() {
  // Initialize the NavigationController
  Get.put(NavigationController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Navbar(), // Use MobileNavbar or Navbar based on constraints
        ),
        body: ResponsiveAllPagesForAllDevices(),
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:portfolio/widgets/ResponsiveAllPagesforAlldevices.dart';
// import 'controller/LoadingController.dart';
// import 'widgets/navbar.dart';
// import 'controller/navigationController.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // Initialize GetX Controllers
//   Get.put(NavigationController());
//   final LoadingController loadingController = Get.put(LoadingController());
//
//   // Simulate a delay for Firebase initialization or API response
//   await Future.delayed(const Duration(seconds: 3)); // Replace with actual Firebase setup if required
//   loadingController.hideLoading(); // Hide loading animation after initialization
//
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final LoadingController loadingController = Get.find<LoadingController>();
//
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Obx(() {
//         // Show Loading Animation while initializing
//         return loadingController.isLoading.value
//             ? Scaffold(
//           body: Container(
//             height: 100,
//             width: 100,
//             child: Center(
//               child: CircularProgressIndicator(
//                 color: Colors.red,
//               ), // Replace with Lottie for better visuals
//             ),
//           ),
//         )
//             : Scaffold(
//           appBar: PreferredSize(
//             preferredSize: const Size.fromHeight(56),
//             child: Navbar(),
//           ),
//           body: ResponsiveAllPagesForAllDevices(),
//         );
//       }),
//     );
//   }
// }
// //
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:portfolio/utils/constant/portfolioAnimationScreen.dart';
// // import 'package:portfolio/widgets/ResponsiveAllPagesforAlldevices.dart';
// // import 'controller/LoadingController.dart';
// //  // Lottie loading screen
// //
// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //
// //   // Initialize controllers
// //   final loadingController = Get.put(LoadingController());
// //   await loadingController.initializeApp(); // Simulate app initialization
// //
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return GetMaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: Obx(() {
// //         final loadingController = Get.find<LoadingController>();
// //         return loadingController.isLoading.value
// //             ? LoadingScreen() // Show Lottie animation during loading
// //             : ResponsiveAllPagesForAllDevices(); // Show main content
// //       }),
// //     );
// //   }
// // }
