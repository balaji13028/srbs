import 'package:get/get.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/utils/ui_halper.dart';

class LoginController extends GetxController {
  var isgetOTP = false.obs;
  var isverifyOTP = false.obs;
  final formKey = GlobalKey<FormState>();
  final PageController pageController = PageController();
  var numberController = TextEditingController().obs;
  var otpController = TextEditingController().obs;
  var isValid = false.obs;
  var islogin = true.obs;

  gotoPage(index) async {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
    otpController.value.clear();
  }

  void login(int position) async {
    if (formKey.currentState!.validate()) {
      AppUiHelper.dismissKeyboard(context: Get.context!);
      newUser.mobileNumber = numberController.value.text.trim();
      if (position == 1) {
        // OTP section logic.

        var res = await LoginDetails().verifyOTP(
            numberController.value.text.trim(),
            otpController.value.text.trim());
        if (res['message'] == 'Invalid OTP') {
          return EasyLoading.showToast(
            'Invalid OTP',
            toastPosition: EasyLoadingToastPosition.top,
          );
        } else if (res['existance'] == false) {
          return Get.off(() => RegistrationScreen());
        } else if (res['existance'] == true) {
          try {
            isverifyOTP(true);
            Get.off(() => const LandingPage());
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('userData', jsonEncode((res['data'])[0]));
            userController.user.value = UserData.fromMap((res['data'])[0]);
            prefs.setBool('isAuthenticated', true);
          } finally {
            isverifyOTP(false);
          }
        } else {
          ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                'Something Went wrong, Please try agian',
                textAlign: TextAlign.center,
              )));
        }
      } else {
        //Generate OTP
        islogin(false);
        var otp = LoginDetails().getOTP(numberController.value.text);
        gotoPage(1);
        otpController.value.text = await otp;
      }
    }
  }
}
