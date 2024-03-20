import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';
import 'package:srbs/Controllers/home%20Controllers/home_controller.dart';
import 'package:srbs/constants/import_packages.dart';

class DonationButton extends StatelessWidget {
  const DonationButton({
    super.key,
    required this.homeController,
    required this.size,
  });

  final HomeController homeController;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Obx(() => homeController.isLoading.value
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              color: ColorPalette.backGroundColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: SkeletonListTile(
                  hasLeading: false,
                  titleStyle: const SkeletonLineStyle(height: 38),
                )))
        : GestureDetector(
            onTap: () {
              Get.dialog(
                DonationCard(
                  size: size,
                  donationDetails: homeController.donationTypeList,
                ),
              );
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
                  SizedBox(width: 10),
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
          ));
  }
}
