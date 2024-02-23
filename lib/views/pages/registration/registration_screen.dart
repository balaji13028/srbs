import 'package:get/get.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/utils/ui_halper.dart';
import 'package:srbs/views/pages/registration/registration_fields.dart';

import '../../../Controllers/login Controllers/registration_controller.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  final registrationController = Get.put(RegistrationController());

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
              Positioned(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.srbsWithFlag,
                      width: size.width * 0.3,
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: size.height * 0.1,
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '  Welcome !',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..shader = ColorPalette.textShaderSecondaryGrdient,
                        ),
                      ),
                    ],
                  )),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  AppImages.registrationBGImage,
                  fit: BoxFit.cover,
                  width: size.width,
                ),
              ),
              Positioned(
                bottom: 0,
                right: -20,
                child: Image.asset(
                  AppImages.registrationFGImage,
                  fit: BoxFit.contain,
                  width: size.height * 0.34,
                ),
              ),
              Positioned(
                  top: size.height * 0.17,
                  height: size.height * 0.38,
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  child: Container(
                      width: size.width,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: ColorPalette.primaryGradient,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Form(
                        key: registrationController.formKey,
                        child: PageView.builder(
                            onPageChanged: (value) {},
                            itemCount: 2,
                            controller: registrationController.pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: size.width,
                                    child: Text(
                                      index == 1 ? 'Verify OTP' : 'Register',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    index == 1
                                        ? 'Choose your gender'
                                        : 'Need few more details to create your account',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  index == 0
                                      ? RegistrationFields(
                                          size: size,
                                          registrationController:
                                              registrationController)
                                      : Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                  AppImages.maleImage,
                                                  height: size.height * 0.1,
                                                ),
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                  AppImages.femaleImage,
                                                  height: size.height * 0.1,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                  SizedBox(height: size.width * 0.1),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (registrationController
                                              .formKey.currentState!
                                              .validate()) {
                                            registrationController
                                                .isValid(false);
                                            AppUiHelper.dismissKeyboard(
                                                context: context);
                                            if (index == 1) {
                                            } else {
                                              registrationController
                                                  .pageController
                                                  .nextPage(
                                                      duration: const Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.easeInOut);
                                            }
                                          } else {
                                            registrationController
                                                .isValid(true);
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
                                            index == 1 ? 'Submit' : 'Next',
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
