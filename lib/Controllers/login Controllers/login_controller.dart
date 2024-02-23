import 'package:get/get.dart';
import 'package:srbs/constants/import_packages.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  final numberController = TextEditingController().obs;
  final otpController = TextEditingController().obs;
  final PageController pageController = PageController();
  var isValid = false.obs;
}
