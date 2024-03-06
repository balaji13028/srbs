import 'package:get/get.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/utils/ui_halper.dart';

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
              // Srbs name logo
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
              // Welcome text.
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
                ),
              ),
              // Background back image.
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  AppImages.registrationBGImage,
                  fit: BoxFit.cover,
                  width: size.width,
                ),
              ),
              // Background front image.
              Positioned(
                bottom: 0,
                right: -20,
                child: Image.asset(
                  AppImages.registrationFGImage,
                  fit: BoxFit.contain,
                  width: size.height * 0.3,
                ),
              ),
              // Fields Container.
              Positioned(
                  top: size.height * 0.17,
                  height: size.width * 0.92,
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
                                    child: const Text(
                                      'Register',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
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
                                  const SizedBox(height: 5),
                                  // Based on position to daiplay the content.
                                  index == 0
                                      ?
                                      // Basic fields section.
                                      RegistrationFields(
                                          size: size,
                                          registrationController:
                                              registrationController,
                                        )
                                      :
                                      // Choose gender section.
                                      GenderSection(
                                          size: size,
                                          registrationController:
                                              registrationController,
                                        ),
                                  SizedBox(height: size.width * 0.1),
                                  // Action Button Area.
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          registrationController.signUp(index);
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
