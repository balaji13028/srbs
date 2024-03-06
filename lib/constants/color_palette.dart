import 'package:srbs/constants/import_packages.dart';

class ColorPalette {
  static Gradient bottomNavButtonGradient = const LinearGradient(
    colors: [Color(0xff6F6F93), Color(0xff8C8CA9)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static Gradient primaryGradient = const LinearGradient(
    colors: [Color(0xff9A9AB3), Color(0xffABABC0)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient secondaryGrdient = LinearGradient(
    colors: [Color(0xffECBA00), Color(0xffE79A02)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static Shader textShaderSecondaryGrdient =
      const LinearGradient(colors: [Color(0xaaECBA00), Color(0xeeE79A02)])
          .createShader(
    const Rect.fromLTWH(100.0, 10.0, 160.0, 0.0),
  );

  static Color labelTextColorwhite = Colors.white.withOpacity(0.7);
  static Color labelTextColorgrey = const Color(0xff4b4b4b).withOpacity(0.6);

  static const Color primaryColor = Color(0xff000040);
  static const Color secondaryColor = Color(0xffE69702);
  static const Color backGroundColor = Color(0xffEEEEEE);
  static const Color lightprimaryColor = Color(0xffDFDFED);
  static const Color greyColor = Color(0xff4b4b4b);
  static const Color lightGreenColor = Color(0xffc3eca4);
  static const Color darkGreenColor = Color(0xff4c7c27);
}
