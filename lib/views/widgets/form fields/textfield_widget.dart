import '../../../constants/import_packages.dart';

class TextFieldWidget extends StatelessWidget {
  final String text;
  final TextEditingController? controller;
  final bool readyOnly;
  final bool autofocus;
  final Widget? suffix;
  final Widget? prefix;
  final Function(String? value)? validator;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? initialValue;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final AutovalidateMode? autovalidateMode;
  final TextCapitalization textCapitalization;

  const TextFieldWidget({
    super.key,
    this.initialValue,
    this.controller,
    this.onTap,
    this.prefix,
    this.readyOnly = false,
    this.autofocus = false,
    this.suffix,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
    this.maxLines = 1,
    this.contentPadding,
    required this.text,
    this.autovalidateMode,
    this.textCapitalization = TextCapitalization.words,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      initialValue: initialValue,
      autocorrect: false,
      autofocus: autofocus,
      readOnly: readyOnly,
      textCapitalization: textCapitalization,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: keyboardType,
      autovalidateMode: autovalidateMode,
      controller: controller,
      style: const TextStyle(fontSize: 18, color: Colors.white),
      cursorColor: Colors.white,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: prefix,
        labelText: text,
        errorStyle:
            TextStyle(fontSize: 10, color: Colors.red.shade700, height: 0.6),
        focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade700)),
        errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade700)),
        labelStyle: TextStyle(
          color: ColorPalette.labelTextColor,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.8,
          fontSize: 16,
        ),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
      ),
      inputFormatters: inputFormatters,
      validator: (value) {
        if (validator != null) {
          return validator!(value);
        } else {
          return null;
        }
      },
    );
  }
}
