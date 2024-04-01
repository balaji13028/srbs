import 'package:get/get.dart';
import 'package:srbs/Controllers/home%20Controllers/home_controller.dart';
import 'package:srbs/constants/import_packages.dart';

class SideDrawer extends StatelessWidget {
  SideDrawer({super.key});

  final List<String> optionsList = [
    'About us',
    'Privacy Policies',
    'Terms Conditions',
    'Logout',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      width: size.width * 0.68,
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.backGroundImage),
                fit: BoxFit.fitHeight)),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              profileDetails(),
              const FractionallySizedBox(
                alignment: Alignment.centerRight,
                widthFactor: 0.9,
                child: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Divider(),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              ...List.generate(
                  optionsList.length,
                  (index) => ListTile(
                        dense: true,
                        onTap: () {
                          Get.find<HomeController>().logout();
                        },
                        title: Text(
                          optionsList[index].toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ColorPalette.primaryColor,
                          ),
                        ),
                      ))
            ],
          ),
        ),
      ),
    );
  }

  ListTile profileDetails() {
    return ListTile(
      onTap: () {},
      leading: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                userController.user.value.gender == 'Male'
                    ? AppImages.maleImage
                    : AppImages.femaleImage,
              ))),
      title: Text(
        userController.user.value.userName.toString(),
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: ColorPalette.primaryColor,
        ),
      ),
      subtitle: Text(
        '+91-${userController.user.value.mobileNumber}',
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: ColorPalette.primaryColor,
        ),
      ),
    );
  }
}
