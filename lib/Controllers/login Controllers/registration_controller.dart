import 'package:get/get.dart';
import '../../constants/import_packages.dart';

class RegistrationController extends GetxController {
  var isLoading = false;
  final formKey = GlobalKey<FormState>();
  final displayNameController = TextEditingController().obs;
  final gothramController = TextEditingController().obs;
  final PageController pageController = PageController();
  var isValid = false.obs;

  @override
  void dispose() {
    displayNameController.value.dispose();
    gothramController.value.dispose();
    pageController.dispose();
    super.dispose();
  }
}
