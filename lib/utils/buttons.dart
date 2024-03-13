import '../constants/import_packages.dart';

class Buttons {
  secondaryButton(
      {VoidCallback? onTap,
      double? fontSize,
      FontWeight? fontWeight,
      required double width,
      required double height,
      required String text}) {
    return GestureDetector(
      onTap: onTap != null ? () => onTap() : () {},
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: ColorPalette.secondaryColor),
          borderRadius: BorderRadius.circular(height),
        ),
        child: Text(
          text,
          softWrap: false,
          style: TextStyle(
            color: ColorPalette.primaryColor,
            fontSize: fontSize ?? 16,
            fontWeight: fontWeight ?? FontWeight.normal,
          ),
        ),
      ),
    );
  }

  primaryButton(
      {VoidCallback? onTap,
      double? fontSize,
      FontWeight? fontWeight,
      double? borderRadius,
      required double width,
      required double height,
      required String text}) {
    return GestureDetector(
      onTap: onTap != null ? () => onTap() : () {},
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: ColorPalette.primaryColor,
            borderRadius: BorderRadius.circular(borderRadius ?? height)),
        child: Text(
          text,
          softWrap: false,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize ?? 16,
            fontWeight: fontWeight ?? FontWeight.w600,
          ),
        ),
      ),
    );
  }

  secondaryGradientButton(
      {Key? key,
      VoidCallback? onTap,
      double? fontSize,
      double? borderRadius,
      List<BoxShadow>? shadows,
      FontWeight? fontWeight,
      required double width,
      required double height,
      required String text}) {
    return GestureDetector(
      key: key,
      onTap: onTap != null ? () => onTap() : () {},
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
            boxShadow: shadows ?? [],
            gradient: ColorPalette.secondaryGrdient,
            borderRadius: BorderRadius.circular(borderRadius ?? height)),
        child: Text(
          text,
          softWrap: false,
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 0.6,
            fontSize: fontSize ?? width * 0.1,
            fontWeight: fontWeight ?? FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
