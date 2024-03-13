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
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () => AppUiHelper.dismissKeyboard(context: context),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.bgImage),
                  fit: BoxFit.fill,
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Stack(children: [
                  // SRBS logo
                  Positioned(
                    width: size.width * 0.26,
                    right: size.width / 2 - size.width * 0.135,
                    child: Hero(
                      tag: 'logo',
                      child: Image.asset(
                        AppImages.logo,
                        width: size.width * 0.26,
                      ),
                    ),
                  ),
                  Positioned(
                      top: size.height * 0.12,
                      width: size.width * 0.3,
                      right: size.width / 2 - size.width * 0.18,
                      child: const Text(
                        'SRBS',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      )),
                  // // Bottom illustation
                  // Align(
                  //   alignment: Alignment.bottomCenter,
                  //   child: Image.asset(
                  //     AppImages.loginImage,
                  //     fit: BoxFit.cover,
                  //     width: size.width,
                  //   ),
                  // ),
                  Positioned(
                    bottom: 0,
                    right: -20,
                    child: Image.asset(
                      AppImages.registrationFGImage,
                      fit: BoxFit.contain,
                      width: size.height * 0.32,
                    ),
                  ),

                  /// Login container box.
                  ///
                  Positioned(
                    top: size.height * 0.19,
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                    child: Container(
                        width: size.width,
                        height: size.width * 0.82,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 0),
                                color: ColorPalette.backGroundColor
                                    .withOpacity(0.9),
                              )
                            ]),
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
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    index == 0
                                        ? const Text(
                                            'Enter mobile number to receive one time password',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black,
                                            ),
                                          )
                                        : Wrap(
                                            children: [
                                              RichText(
                                                  text: TextSpan(children: [
                                                    const TextSpan(
                                                      text:
                                                          'Please enter 6 digits verification code sent to your mobile number ',
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                        height: 1.4,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          '+91-${loginController.numberController.value.text}.  ',
                                                      style: const TextStyle(
                                                        fontSize: 11,
                                                        height: 1.4,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: 'Wrong number?',
                                                      style: const TextStyle(
                                                        fontSize: 11,
                                                        height: 1.4,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: ColorPalette
                                                            .primaryColor,
                                                      ),
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () =>
                                                                loginController
                                                                    .gotoPage(
                                                                        0),
                                                    ),
                                                  ]),
                                                  textScaler:
                                                      const TextScaler.linear(
                                                          1.1)),
                                            ],
                                          ),
                                    const SizedBox(height: 10),
                                    Obx(
                                      () => index == 1
                                          ? TextFieldWidget(
                                              borderColor: Colors.black,
                                              lableColor: Colors.black54,
                                              text: 'Enter OTP',
                                              controller: loginController
                                                  .otpController.value,
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                                LengthLimitingTextInputFormatter(
                                                    6)
                                              ],
                                              prefix: Image.asset(
                                                AppImages.otpIcon,
                                                color: Colors.black54,
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
                                              borderColor: Colors.black,
                                              lableColor: Colors.black54,
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
                                                color: Colors.black,
                                                size: size.height * 0.034,
                                              ),
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                                LengthLimitingTextInputFormatter(
                                                    10)
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
                                            ),
                                    ),
                                    SizedBox(height: size.width * 0.1),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            loginController.login(index);
                                          },
                                          child: Obx(
                                            () => loginController
                                                    .isverifyOTP.value
                                                ? const Center(
                                                    child: SizedBox(
                                                      height: 40,
                                                      width: 40,
                                                      child:
                                                          CircularProgressIndicator(),
                                                    ),
                                                  )
                                                : Container(
                                                    height: size.width * 0.095,
                                                    width: size.width * 0.3,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      gradient: ColorPalette
                                                          .secondaryGrdient,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    child: Text(
                                                      index == 1
                                                          ? 'Verify'
                                                          : 'Get OTP',
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        letterSpacing: 0.7,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }),
                        )),
                  ),
                ]),
              ),
            )),
      ),
    );
  }
}
