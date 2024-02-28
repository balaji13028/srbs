import 'package:get/get.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/utils/ui_halper.dart';

class RegistrationController extends GetxController {
  var isLoading = false.obs;
  var formKey = GlobalKey<FormState>();
  PageController pageController = PageController();
  var displayNameController = TextEditingController().obs;
  var gothramController = TextEditingController().obs;
  var gender = ''.obs;
  var male = 'Male';
  var female = 'Female';

  void signUp(int position) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (position == 0) {
      if (formKey.currentState!.validate()) {
        AppUiHelper.dismissKeyboard(context: Get.context!);
        pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
      }
    } else {
      try {
        isLoading(true);
        Get.offAll(() => const LandingPage());
        Map<String, dynamic> data = {
          'mobileNumber': newUser.mobileNumber,
          'userName': displayNameController.value.text,
          'gender': gender.value,
          'gothram': gothramController.value.text,
        };

        var res = await LoginDetails().createAccount(data);
        if (res != null) {
          prefs.setString('userData', jsonEncode((res['data'])[0]));
          userController.user.value = UserData.fromMap((res['data'])[0]);
          prefs.setBool('isAuthenticated', true);
        }
      } finally {
        isLoading(false);
      }
    }
  }
}
