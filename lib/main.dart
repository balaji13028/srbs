import 'package:get/route_manager.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/utils/ui_halper.dart';
import 'package:srbs/views/pages/login/login_screen.dart';

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
      home: LoginScreen(),
    );
  }
}
