import 'package:get/get.dart';
import 'package:srbs/Models/user%20models/user_data.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  var user = UserData().obs;
}

final userController = UserController();
