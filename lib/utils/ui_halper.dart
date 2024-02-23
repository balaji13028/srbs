import 'package:srbs/constants/import_packages.dart';

class AppUiHelper {
  /// Dismissises Keyboard From Anywhere
  static void dismissKeyboard({required BuildContext context}) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  /// Set The Portrait as Default Orientation
  static void dontAutoRotate() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}
