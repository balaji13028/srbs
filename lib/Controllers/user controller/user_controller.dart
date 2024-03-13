import 'package:get/get.dart';
import 'package:srbs/Models/user%20models/user_data.dart';

class UserController extends GetxController {
  var isprofileLoading = false.obs;
  var user = UserData().obs;
}

final userController = UserController();

Future<String> checkStatus() async {
  if (userController.user.value.firstName == null &&
      userController.user.value.lastName == null &&
      userController.user.value.address == null) {
    userController.user.value.profileStatus = '57%';
    return '57%';
  } else if (userController.user.value.firstName == null &&
          userController.user.value.lastName == null ||
      userController.user.value.firstName == null &&
          userController.user.value.address == null ||
      userController.user.value.lastName == null &&
          userController.user.value.address == null) {
    userController.user.value.profileStatus = '71%';
    return '71%';
  } else if (userController.user.value.firstName == null ||
      userController.user.value.lastName == null ||
      userController.user.value.address == null) {
    userController.user.value.profileStatus = '86%';
    return '86%';
  } else {
    userController.user.value.profileStatus = '100%';
    return '100%';
  }
}
