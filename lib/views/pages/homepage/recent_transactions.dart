import 'package:flutter/widgets.dart';
import 'package:skeletons/skeletons.dart';
import 'package:srbs/Controllers/home%20Controllers/home_controller.dart';
import 'package:srbs/constants/import_packages.dart';

class RecentTransactions extends StatelessWidget {
  final Size size;
  final HomeController controller;
  const RecentTransactions(
      {super.key, required this.controller, required this.size});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value
        ? Expanded(child: SkeletonListView())
        : Container(
            width: size.width,
            padding: const EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: ColorPalette.backGroundColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: AppDefaults.defaultBoxShadow,
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Upcoming / Ongoing Events',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ColorPalette.primaryColor,
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ])));
  }
}
