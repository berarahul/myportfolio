import 'package:get/get.dart';

class LoadingController extends GetxController {
  var isLoading = true.obs;

  // Simulate initialization (or API call)
  Future<void> initializeApp() async {
    await Future.delayed(Duration(seconds: 3)); // Replace with real initialization
    isLoading(false); // Set loading to false after initialization
  }
}
