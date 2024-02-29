import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/utils/ui_halper.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => AppUiHelper.dismissKeyboard(context: context),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            bottom: false,
            child: Stack(children: [
              // SRBS logo
              Positioned(
                width: size.width * 0.3,
                right: size.width / 2 - size.width * 0.15,
                child: Image.asset(
                  AppImages.srbsWithFlag,
                  width: size.width * 0.3,
                ),
              ),
              // Bottom illustation
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  AppImages.loginImage,
                  fit: BoxFit.cover,
                  width: size.width,
                ),
              ),

              /// Login container box.
              Positioned(
                  top: size.height * 0.14,
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  child: Container(
                      width: size.width,
                      height: size.height * 0.34,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: ColorPalette.primaryGradient,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Form(
                        key: loginController.formKey,
                        child: PageView.builder(
                            onPageChanged: (value) {},
                            itemCount: 2,
                            controller: loginController.pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: size.width,
                                    child: Text(
                                      index == 1 ? 'Verify OTP' : 'Login',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Wrap(
                                    spacing: 1,
                                    runSpacing: 1.4,
                                    children: [
                                      Text(
                                        index == 1
                                            ? 'Please enter 6 digits verification code sent to your mobile number '
                                            : 'Enter mobile number to receive one time password',
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        index == 1
                                            ? '+91-${loginController.numberController.value.text}.  '
                                            : '',
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          loginController.pageController
                                              .previousPage(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeInBack,
                                          );
                                          loginController.otpController.value
                                              .clear();
                                        },
                                        child: Text(
                                          index == 1 ? 'Wrong number?' : '',
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontSize: 10,
                                            height: 0,
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.w700,
                                            color: ColorPalette.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Obx(() => index == 1
                                      ? TextFieldWidget(
                                          text: 'Enter OTP',
                                          controller: loginController
                                              .otpController.value,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(6)
                                          ],
                                          prefix: Image.asset(
                                            AppImages.otpIcon,
                                            color: Colors.white,
                                            scale: 25,
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return "Enter OTP";
                                            } else if (value.length < 6) {
                                              return "Enter valid OTP ";
                                            }
                                            return null;
                                          },
                                        )
                                      : TextFieldWidget(
                                          text: 'Mobile Number',
                                          controller: loginController
                                              .numberController.value,
                                          autovalidateMode:
                                              loginController.isValid.value
                                                  ? AutovalidateMode
                                                      .onUserInteraction
                                                  : null,
                                          prefix: Icon(
                                            CupertinoIcons
                                                .device_phone_portrait,
                                            color: Colors.white,
                                            size: size.height * 0.034,
                                          ),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(10)
                                          ],
                                          validator: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return "Enter mobile number";
                                            } else if (value.length < 10) {
                                              return "Enter valid mobile number";
                                            }
                                            return null;
                                          },
                                        )),
                                  SizedBox(height: size.width * 0.12),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          loginController.login(index);
                                        },
                                        child: Container(
                                          height: size.width * 0.095,
                                          width: size.width * 0.3,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            gradient:
                                                ColorPalette.secondaryGrdient,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: Text(
                                            index == 1 ? 'Verify' : 'Get OTP',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              letterSpacing: 0.7,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }),
                      ))),
            ]),
          )),
    );
  }
}
