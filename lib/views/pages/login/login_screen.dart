import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:srbs/Controllers/login%20Controllers/login_controller.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/utils/ui_halper.dart';
import 'package:srbs/views/pages/registration/registration_screen.dart';

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
          body: Stack(children: [
            Positioned(
              top: size.height * 0.1,
              width: size.width * 0.3,
              right: size.width / 2 - size.width * 0.15,
              child: Image.asset(
                AppImages.srbsWithFlag,
                width: size.width * 0.3,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                AppImages.loginImage,
                fit: BoxFit.cover,
                width: size.width,
              ),
            ),
            Positioned(
                top: size.height * 0.24,
                left: size.width * 0.05,
                right: size.width * 0.05,
                child: Container(
                    width: size.width,
                    height: size.height * 0.32,
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
                                  children: [
                                    Text(
                                      index == 1
                                          ? 'Enter one time password received to the '
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
                                          ? '${loginController.numberController.value.text}  '
                                          : '',
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        loginController.pageController
                                            .previousPage(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeInBack,
                                        );
                                      },
                                      child: Text(
                                        index == 1 ? 'Change' : '',
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          height: 1,
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w700,
                                          color: ColorPalette.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Obx(() => TextFormField(
                                      autocorrect: false,
                                      autovalidateMode: loginController
                                              .isValid.value
                                          ? AutovalidateMode.onUserInteraction
                                          : null,
                                      controller: index == 1
                                          ? loginController.otpController.value
                                          : loginController
                                              .numberController.value,
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.white),
                                      cursorColor: Colors.white,
                                      textInputAction: TextInputAction.done,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      readOnly: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        prefixIcon: Icon(
                                          index == 1
                                              ? Icons.send_to_mobile_rounded
                                              : CupertinoIcons
                                                  .device_phone_portrait,
                                          color: Colors.white,
                                          size: size.height * 0.034,
                                        ),
                                        labelText: index == 1
                                            ? 'Enter OTP'
                                            : 'Mobile number',
                                        errorStyle: TextStyle(
                                            fontSize: 10,
                                            color: Colors.red.shade700),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.red.shade700)),
                                        errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.red.shade700)),
                                        labelStyle: TextStyle(
                                          color: ColorPalette.labelTextColor,
                                          fontWeight: FontWeight.w300,
                                          letterSpacing: 0.8,
                                          fontSize: 16,
                                        ),
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white)),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white)),
                                      ),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(
                                            index == 1 ? 6 : 10)
                                      ],
                                      validator: (value) {
                                        if (index == 1) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return "Enter OTP";
                                          } else if (value.length < 6) {
                                            return "Enter valid OTP ";
                                          }
                                        } else {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return "Enter mobile number";
                                          } else if (value.length < 10) {
                                            return "Enter valid mobile number";
                                          }
                                        }
                                        return null;
                                      },
                                    )),
                                SizedBox(height: size.width * 0.12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (loginController
                                            .formKey.currentState!
                                            .validate()) {
                                          loginController.isValid(false);
                                          AppUiHelper.dismissKeyboard(
                                              context: context);
                                          if (index == 1) {
                                            Get.off(() => RegistrationScreen());
                                          } else {
                                            loginController.pageController
                                                .nextPage(
                                                    duration: const Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.easeInOut);
                                          }
                                        } else {
                                          loginController.isValid(true);
                                        }
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
          ])),
    );
  }
}
