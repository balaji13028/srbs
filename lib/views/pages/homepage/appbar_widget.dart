import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/views/pages/notifications/notifications.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Size size;
  const AppBarWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Visibility(
        visible: false,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.power_settings_new,
            color: ColorPalette.primaryColor,
          ),
        ),
      ),
      automaticallyImplyLeading: false,
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
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            onPressed: () {
              Get.to(() => const NotificationsPage());
            },
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              radius: size.width * 0.047,
              child: const Icon(
                CupertinoIcons.bell_fill,
                color: ColorPalette.primaryColor,
                size: 24,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight + 6);
}
