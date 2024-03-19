import 'package:flutter/cupertino.dart';
import 'package:srbs/constants/import_packages.dart';

class LoginFields extends StatelessWidget {
  final LoginController loginController;
  final Size size;
  const LoginFields(
      {super.key, required this.size, required this.loginController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: size.width,
          child: const Text(
            'Login',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Enter mobile number to receive one time password',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            TextFieldWidget(
              borderColor: Colors.black,
              lableColor: Colors.black54,
              text: 'Mobile Number',
              controller: loginController.numberController.value,
              autovalidateMode: loginController.isValid.value
                  ? AutovalidateMode.onUserInteraction
                  : null,
              prefix: Icon(
                CupertinoIcons.device_phone_portrait,
                color: Colors.black54,
                size: size.height * 0.034,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10)
              ],
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Enter mobile number";
                } else if (value.length < 10) {
                  return "Enter valid mobile number";
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'By enter mobile number, you agree to our Privacy Policy and Terms of use',
                    style: TextStyle(
                      fontSize: 11,
                      height: 1.4,
                      fontWeight: FontWeight.w300,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
