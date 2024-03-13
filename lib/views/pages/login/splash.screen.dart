import 'package:get/get.dart';
import 'package:srbs/constants/import_packages.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final auth = Get.find<AuthService>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppImages.splash_Image), fit: BoxFit.fill),
      ),
      child: Hero(
        tag: 'logo',
        child: Image.asset(
          AppImages.logo,
          scale: size.width * 0.0069,
        ),
      ),
    );
  }
}
