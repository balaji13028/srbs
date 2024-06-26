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
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(AppImages.bgImage),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: SafeArea(
              bottom: false,
              child: Stack(children: [
                // Srbs name logo
                Positioned(
                  top: 10,
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: 'logo',
                        child: Image.asset(
                          AppImages.logo,
                          width: size.width * 0.14,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'SRBS',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                // Welcome text.
                Positioned(
                  top: size.height * 0.09,
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
                    top: size.height * 0.16,
                    height: size.height * 0.39,
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                    child: Container(
                        width: size.width,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 0),
                                color: ColorPalette.backGroundColor
                                    .withOpacity(0.9),
                              ),
                            ]),
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
                                          color: Colors.black,
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
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            registrationController
                                                .signUp(index);
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
      ),
    );
  }
}
