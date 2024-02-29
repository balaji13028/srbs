import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:srbs/views/pages/gallery/gallery_page.dart';
import 'package:srbs/views/pages/transactions/transactions_page.dart';

import '../../../constants/import_packages.dart';

class LandingPage extends GetView<LandingPageController> {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LandingPageController());
    return Scaffold(
        body: Obx(() => IndexedStack(
              index: controller.tabIndex.value,
              children: [
                const GalleryPage(),
                HomePage(),
                const TransactionsPage(),
              ],
            )),
        bottomNavigationBar: Obx(() => CurvedNavigationBar(
              color: ColorPalette.primaryColor.withOpacity(0.8),
              backgroundColor: Colors.transparent,
              index: controller.tabIndex.value,
              buttonBackgroundColor: ColorPalette.bottomNavButtonGradient,
              items: [
                CurvedNavigationBarItem(
                    child: const Icon(
                      CupertinoIcons.photo_on_rectangle,
                      color: Colors.white,
                    ),
                    label: 'Gallery',
                    labelStyle: TextStyle(
                      color: 0 != controller.tabIndex.value
                          ? Colors.white
                          : Colors.transparent,
                    )),
                CurvedNavigationBarItem(
                    child: Icon(
                      MdiIcons.viewDashboardOutline,
                      color: Colors.white,
                    ),
                    label: 'Home',
                    labelStyle: TextStyle(
                      color: 1 != controller.tabIndex.value
                          ? Colors.white
                          : Colors.transparent,
                    )),
                CurvedNavigationBarItem(
                    child: Icon(
                      MdiIcons.swapHorizontal,
                      color: Colors.white,
                      size: 32,
                    ),
                    label: 'Transactions',
                    labelStyle: TextStyle(
                      color: 2 != controller.tabIndex.value
                          ? Colors.white
                          : Colors.transparent,
                    ))
              ],
              height: 85,
              onTap: (value) => controller.changeTabIndex(value),
            )));
  }
}
