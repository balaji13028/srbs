import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/views/pages/gallery/gallery_page.dart';
import 'package:srbs/views/pages/transactions/transactions_page.dart';

class LandingPageController extends GetxController {
  static LandingPageController get to => Get.find();
  var tabIndex = 1.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  final List<Widget> pages = [
    const GalleryPage(),
    HomePage(),
    const TransactionsPage(),
  ];
}
