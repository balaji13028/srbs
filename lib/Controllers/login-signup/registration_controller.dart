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
  var isfields = true.obs;
  var isVaild = false.obs;

  void signUp(int position) async {
    if (position == 0) {
      if (formKey.currentState!.validate()) {
        isfields(false);
        AppUiHelper.dismissKeyboard(context: Get.context!);
        pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
      } else {
        isVaild(false);
      }
    } else {
      if (gender == '') {
        EasyLoading.showInfo("Please select your gender", dismissOnTap: true);
      } else {
        try {
          isLoading(true);
          userController.isprofileLoading(true);
          Get.offAll(() => const LandingPage());
          Map<String, dynamic> data = {
            'mobileNumber': newUser.mobileNumber,
            'userName': displayNameController.value.text,
            'gender': gender.value,
            'gothram': gothramController.value.text,
            // 'firstName': 'null',
            // 'lastName': 'null',
            // 'address': 'null',
          };

          var res = await LoginDetails().createAccount(data);
          if (res != null) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('userData', jsonEncode((res['data'])[0]));
            userController.user.value = UserData.fromMap((res['data'])[0]);
            await prefs.setBool('isAuthenticated', true);
          }
        } finally {
          isLoading(false);
          userController.isprofileLoading(false);
        }
      }
    }
  }
}
