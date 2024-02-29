import 'package:get/state_manager.dart';
import 'package:srbs/constants/import_packages.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchHomescreendata();
    super.onInit();
  }

  fetchHomescreendata() async {
    try {
      isLoading(true);
    } finally {
      isLoading(false);
    }
  }

  profile() {
    try {
      userController.isprofileLoading(true);
    } finally {
      userController.isprofileLoading(false);
    }
  }
}
