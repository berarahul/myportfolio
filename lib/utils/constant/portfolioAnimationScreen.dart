// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
//
// class LoadingScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Lottie.asset(
//           'assets/loading.json', // Path to your Lottie animation file
//           width: 200,
//           height: 200,
//           fit: BoxFit.contain,
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        body: Center(
          child: Lottie.asset(
            'assets/loading.json',
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
        ),
      );
    } catch (e) {
      print('Error loading Lottie animation: $e');
      return Center(child: Text('Failed to load animation'));
    }
  }
}
