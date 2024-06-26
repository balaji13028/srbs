import 'package:flutter/cupertino.dart';
import 'package:srbs/constants/import_packages.dart';

class RegistrationFields extends StatelessWidget {
  final Size size;
  final RegistrationController registrationController;
  const RegistrationFields({
    super.key,
    required this.size,
    required this.registrationController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWidget(
          borderColor: Colors.black,
          lableColor: Colors.black54,
          text: 'Display Name / పేరు ',
          prefix: Icon(
            CupertinoIcons.person,
            color: Colors.black,
            size: size.height * 0.034,
          ),
          controller: registrationController.displayNameController.value,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "*This field is mandatory";
            } else {
              return null;
            }
          },
        ),
        TextFieldWidget(
          borderColor: Colors.black,
          lableColor: Colors.black54,
          text: 'Gothram / గోత్రం',
          prefix: Image.asset(
            AppImages.gothramIcon,
            width: size.width * 0.1,
            scale: 24,
            color: Colors.black,
            alignment: Alignment.center,
            matchTextDirection: true,
            isAntiAlias: true,
            gaplessPlayback: true,
          ),
          controller: registrationController.gothramController.value,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "*This field is mandatory";
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
