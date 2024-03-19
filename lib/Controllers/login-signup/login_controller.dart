import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:get/get.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/services/provider/shared_preference.dart';
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
  var starttime = 30.00.obs;
  Timer? timer;

  /// MOve to next or previous index;
  gotoPage(index) async {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
    otpController.value.clear();
  }

  /// Login function for both oghin and otp places.
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
          timer!.cancel();
          return Get.off(() => RegistrationScreen());
        } else if (res['existance'] == true) {
          try {
            isverifyOTP(true);
            userController.user.value = UserData.fromMap((res['data'])[0]);
            checkStatus();
            Get.off(() => const LandingPage());
            SharedPreferencesService prefs = SharedPreferencesService.to;
            await prefs.saveUserData(jsonEncode(userController.user));
            prefs.setboolData('isAuthenticated', true);
          } finally {
            timer!.cancel();
            isverifyOTP(false);
            numberController.value.clear();
            gotoPage(0);
          }
        } else {
          timer!.cancel();
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
        startTimer();
        initSmsListener();
        otpController.value.text = await otp;
      }
    }
  }

  /// Listen the incoming sms to get otp.
  Future<void> initSmsListener() async {
    String? commingSms;
    try {
      commingSms = await AltSmsAutofill().listenForSms;
      if (commingSms != null) {
        otpController.value.text = commingSms.toString();
      }
    } catch (e) {
      print('$e Failed to get Sms.');
    }
  }

  /// TO start the timer to disbled resend option.
  startTimer() async {
    starttime.value = 30.00;
    var otp = LoginDetails().getOTP(numberController.value.text);
    initSmsListener();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (starttime.value == 0) {
        timer.cancel();
      } else {
        starttime.value--;
      }
    });
    otpController.value.text = await otp;
  }

  @override
  void dispose() {
    numberController.value.dispose();
    otpController.value.dispose();
    pageController.dispose();
    AltSmsAutofill().unregisterListener();
    super.dispose();
  }

  @override
  void onClose() {
    numberController.value.dispose();
    otpController.value.dispose();
    pageController.dispose();
    super.onClose();
  }
}
