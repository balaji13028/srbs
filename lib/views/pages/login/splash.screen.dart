import 'package:get/get.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/services/provider/auth_service.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final auth = Get.find<AuthService>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.splashImage))),
    );
  }
}
