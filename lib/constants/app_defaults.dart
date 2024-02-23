import 'package:srbs/constants/import_packages.dart';

class AppDefaults {
  /// Used For Border Radius
  static BorderRadius defaulBorderRadius = BorderRadius.circular(10);

  /// Used For Bottom Sheet
  static BorderRadius defaultBottomSheetRadius = const BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  );

  /// Used For Top Sheet
  static BorderRadius defaultTopSheetRadius = const BorderRadius.only(
    bottomLeft: Radius.circular(20),
    bottomRight: Radius.circular(20),
  );

  /// Default Box Shadow used for containers
  static List<BoxShadow> defaultBoxShadow = [
    BoxShadow(
      blurRadius: 25,
      spreadRadius: 0,
      offset: const Offset(0, 2),
      color: Colors.black.withOpacity(0.08),
    ),
  ];

  /// Default Animation Duration used for the entire app
  static Duration defaultDuration = const Duration(milliseconds: 300);
}
