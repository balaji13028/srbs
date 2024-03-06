import 'package:dropdown_button2/dropdown_button2.dart';

import '../../../constants/import_packages.dart';

class DropDownFormFieldWidget extends StatelessWidget {
  final String text;
  final List<DropdownMenuItem<String>> listItems;
  final String? initialValue;
  final VoidCallback? ontap;
  final Color? borderColor;
  final Color? lableColor;
  final EdgeInsetsGeometry? contentPadding;
  final Function(String? value) onChanged;
  const DropDownFormFieldWidget({
    super.key,
    this.contentPadding,
    required this.text,
    required this.listItems,
    required this.initialValue,
    this.ontap,
    this.lableColor,
    this.borderColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.only(left: 10, right: 14),
      ),
      alignment: AlignmentDirectional.centerStart,
      isDense: true,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        labelText: text,
        errorStyle:
            TextStyle(fontSize: 10, color: Colors.red.shade700, height: 0.1),
        focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade700)),
        errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade700)),
        labelStyle: TextStyle(
          color: lableColor ?? ColorPalette.labelTextColorwhite,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.8,
          fontSize: 16,
        ),
        alignLabelWithHint: true,
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? Colors.white)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? Colors.white)),
      ),
      validator: (value) {
        if (value == null) {
          return '*This field is mandatory';
        }
        return null;
      },
      items: listItems,
      value: initialValue,
      onChanged: (value) {
        onChanged(value);
      },
    );
  }
}
