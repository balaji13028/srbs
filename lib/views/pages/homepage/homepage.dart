import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:srbs/Controllers/home%20Controllers/home_controller.dart';
import 'package:srbs/constants/import_packages.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homecOntroller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.logo,
              scale: size.height * 0.032,
            ),
            const SizedBox(width: 5),
            const Text('SRBS'),
          ],
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..shader = ColorPalette.textShaderSecondaryGrdient),
        actions: [
          IconButton(
              onPressed: () {
                Get.find<AuthService>().logout();
              },
              icon: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.power_settings_new,
                  color: ColorPalette.primaryColor,
                ),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.backGroundImage),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              const SizedBox(height: 5),
              ProfileCard(size: size),
              const SizedBox(height: 20),
              UpcoimgEvents(size: size),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Get.dialog(DonationCard(size: size));
                },
                child: Container(
                  height: size.width * .12,
                  width: size.width,
                  decoration: BoxDecoration(
                    gradient: ColorPalette.secondaryGrdient,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
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
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}