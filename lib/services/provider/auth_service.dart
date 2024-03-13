import 'package:get/get.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/services/provider/shared_preference.dart';

class AuthService extends GetxController {
  RxBool isAuthenticated = false.obs;

  @override
  void onInit() {
    checkLoginStatus();
    super.onInit();
  }

  Future<void> checkLoginStatus() async {
    SharedPreferencesService prefs = SharedPreferencesService.to;
    isAuthenticated.value = prefs.getboolData('isAuthenticated') ?? false;
    // Checking the userdata key is there or not.
    if (prefs.isContinekey('userData') == true) {
      userController.user.value = prefs.getUserData()!;
    }
    Future.delayed(const Duration(seconds: 2), () {
      if (isAuthenticated.value) {
        Get.offNamed('/landingPage'); // Navigate to home page
      } else {
        Navigator.of(Get.context!)
            .pushReplacement(createRoute()); // Navigate to login page.
      }
      // });
    });
  }

  Route createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
