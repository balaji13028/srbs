import 'package:get/get.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/services/provider/auth_service.dart';
import 'package:srbs/utils/ui_halper.dart';
import 'package:srbs/views/pages/landing%20page/landing_page.dart';
import 'package:srbs/views/pages/login/login_screen.dart';
import 'package:srbs/views/pages/login/splash.screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppUiHelper.dontAutoRotate();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SRBS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: ColorPalette.primaryColor,
              primaryContainer: ColorPalette.primaryColor,
            ),
      ),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => AuthService(), fenix: true);
        Get.lazyPut(() => UserController(), fenix: true);
      }),
      getPages: [
        GetPage(name: '/splshPage', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/landingPage', page: () => const LandingPage()),
      ],
      initialRoute: '/splshPage',
      builder: EasyLoading.init(),
    );
  }
}
