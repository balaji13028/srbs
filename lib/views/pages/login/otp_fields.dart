import 'package:flutter/cupertino.dart';
import 'package:srbs/constants/import_packages.dart';

class OTPFields extends StatelessWidget {
  final LoginController loginController;
  final Size size;
  const OTPFields(
      {super.key, required this.size, required this.loginController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: size.width,
          child: const Text(
            'Verify OTP',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          children: [
            RichText(
              text: TextSpan(children: [
                const TextSpan(
                  text:
                      'Please enter 6 digits verification code sent to your mobile number ',
                  style: TextStyle(
                    fontSize: 11,
                    height: 1.4,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: '+91-${loginController.numberController.value.text}.  ',
                  style: const TextStyle(
                    fontSize: 11,
                    height: 1.4,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: 'Wrong number?',
                  style: const TextStyle(
                    fontSize: 11,
                    height: 1.4,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w700,
                    color: ColorPalette.primaryColor,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => loginController.gotoPage(0),
                ),
              ]),
              textScaler: const TextScaler.linear(1.1),
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextFieldWidget(
          borderColor: Colors.black,
          lableColor: Colors.black54,
          text: 'Enter OTP',
          controller: loginController.otpController.value,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(6)
          ],
          prefix: Image.asset(
            AppImages.otpIcon,
            color: Colors.black54,
            scale: 25,
          ),
          suffix: Obx(
            () => loginController.starttime.value == 0
                ? IconButton(
                    onPressed: () {
                      loginController.otpController.value.clear();
                      loginController.startTimer();
                    },
                    icon: const Icon(
                      CupertinoIcons.arrow_clockwise,
                      color: Colors.black,
                      size: 21,
                    ))
                : Padding(
                    padding: const EdgeInsets.only(right: 10, top: 5),
                    child: Text(
                      loginController.starttime.value <= 9
                          ? '0${loginController.starttime}0'
                          : '${loginController.starttime}0',
                      style: const TextStyle(
                        fontSize: 16,
                        height: 0,
                      ),
                    ),
                  ),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "Enter OTP";
            } else if (value.length < 6) {
              return "Enter valid OTP ";
            }
            return null;
          },
        )
      ],
    );
  }
}
