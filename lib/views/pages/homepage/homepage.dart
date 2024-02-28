import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:srbs/constants/import_packages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const SizedBox(height: 5),
              ProfileCard(size: size),
              const SizedBox(height: 20),
              UpcoimgEvents(size: size),
              const SizedBox(height: 20),
              Container(
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
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Make Donation'),
                  ],
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
