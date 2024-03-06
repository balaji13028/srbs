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
          text: 'Display Name',
          prefix: Icon(
            CupertinoIcons.person,
            color: Colors.white,
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
          text: 'Gothram',
          prefix: Image.asset(
            AppImages.gothramIcon,
            width: size.width * 0.1,
            scale: 24,
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
