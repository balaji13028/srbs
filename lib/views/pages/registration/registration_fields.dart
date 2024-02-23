import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:srbs/Controllers/login%20Controllers/registration_controller.dart';

import '../../widgets/form fields/textfield_widget.dart';

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
        const SizedBox(height: 10),
        TextFieldWidget(
          text: 'Gothram',
          prefix: Icon(
            CupertinoIcons.plus_square_on_square,
            color: Colors.white,
            size: size.height * 0.034,
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
