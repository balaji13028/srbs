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
      blurRadius: 8,
      spreadRadius: 0,
      offset: const Offset(2, 2),
      color: Colors.grey.withOpacity(0.5),
    ),
  ];

  /// Default Animation Duration used for the entire app
  static Duration defaultDuration = const Duration(milliseconds: 300);
}