import 'package:get/get.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/utils/ui_halper.dart';

import 'services/provider/shared_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppUiHelper.dontAutoRotate();
  await Get.put(SharedPreferencesService()).initSharedPreferences();
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
        fontFamily: 'Averia Serif Libre',
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: 'Averia Serif Libre',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: ColorPalette.primaryColor,
            iconTheme: IconThemeData(color: Colors.white),
            centerTitle: true,
            foregroundColor: Colors.white),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: ColorPalette.primaryColor,
              primaryContainer: ColorPalette.primaryColor,
            ),
      ),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => AuthService(), fenix: true);
        Get.lazyPut(() => SharedPreferencesService(), fenix: true);
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
