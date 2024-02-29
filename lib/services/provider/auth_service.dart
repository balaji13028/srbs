import 'package:get/get.dart';
import 'package:srbs/constants/import_packages.dart';

class AuthService extends GetxController {
  RxBool isAuthenticated = false.obs;

  @override
  void onInit() {
    checkLoginStatus();
    super.onInit();
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isAuthenticated.value = prefs.getBool('isAuthenticated') ?? false;
    if (prefs.containsKey('userData')) {
      var jsonDeatils = jsonDecode(prefs.getString('userData')!);

      userController.user.value = UserData.fromMap(jsonDeatils);
    }
    Future.delayed(const Duration(seconds: 2), () {
      if (isAuthenticated.value) {
        Get.offNamed('/landingPage'); // Navigate to home page
      } else {
        Get.offNamed('/login');
      }
    });
  }

  Future<void> logout() async {
    // Clear authentication status in shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAuthenticated', false);
    await prefs.remove('userData');
    isAuthenticated.value = false;
    Get.offNamed('/login'); // Navigate to login page
  }
}
