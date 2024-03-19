import 'package:get/get.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/utils/ui_halper.dart';
import 'package:srbs/views/pages/login/login_fields.dart';
import 'package:srbs/views/pages/login/otp_fields.dart';

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
              child: Stack(
                children: [
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
                  // Bottom illustation
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
                  Positioned(
                    top: size.height * 0.19,
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                    child: Container(
                      width: size.width,
                      height: size.height * 0.36,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 0),
                              color:
                                  ColorPalette.backGroundColor.withOpacity(0.9),
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
                              children: [
                                index == 1
                                    ? OTPFields(
                                        size: size,
                                        loginController: loginController)
                                    : LoginFields(
                                        size: size,
                                        loginController: loginController,
                                      ),
                                SizedBox(height: size.width * 0.1),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        loginController.login(index);
                                      },
                                      child: Obx(
                                        () => loginController.isverifyOTP.value
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
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Text(
                                                  index == 1
                                                      ? 'Verify'
                                                      : 'Get OTP',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    letterSpacing: 0.7,
                                                    fontWeight: FontWeight.bold,
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
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
