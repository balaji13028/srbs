import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';
import 'package:srbs/Controllers/home%20Controllers/home_controller.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/services/provider/shared_preference.dart';
import 'package:srbs/views/pages/donation/payment_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Future<void> logout() async {
      SharedPreferencesService prefs = SharedPreferencesService.to;
      // Clear authentication status in shared preferences
      prefs.setboolData('isAuthenticated', false);
      prefs.clearAllData();
      Get.offAll(() => LoginScreen()); // Navigate to login page
    }

    Size size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          leading: Visibility(
            visible: false,
            child: IconButton(
                onPressed: () {},
                icon: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.power_settings_new,
                    color: ColorPalette.primaryColor,
                  ),
                )),
          ),
          automaticallyImplyLeading: false,
          elevation: 2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.logo,
                scale: size.height * 0.032,
              ),
              const SizedBox(width: 5),
              const Text(
                'SRBS',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  logout();
                },
                icon: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.power_settings_new,
                    color: ColorPalette.primaryColor,
                    size: 28,
                  ),
                ))
          ],
        ),
        body: Container(
          height: size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.backGroundImage),
                fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 5),
                  ProfileCard(size: size),
                  const SizedBox(height: 20),
                  UpcoimgEvents(controller: homeController),
                  const SizedBox(height: 20),
                  Obx(() => homeController.isLoading.value
                      ? SkeletonListTile()
                      : GestureDetector(
                          onTap: () {
                            Get.to(() => Paymentscreen(
                                donationDetails:
                                    homeController.donationTypeList));
                            // Get.dialog(DonationCard(
                            //   size: size,
                            //   donationDetails: homeController.donationTypeList,
                            // ));
                          },
                          child: Container(
                            height: size.width * .12,
                            width: size.width,
                            decoration: BoxDecoration(
                              gradient: ColorPalette.secondaryGrdient,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.arrow_right,
                                  color: Colors.white,
                                  size: 28,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Make Donation',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
