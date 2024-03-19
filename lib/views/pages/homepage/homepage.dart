import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';
import 'package:srbs/Controllers/home%20Controllers/home_controller.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/views/pages/homepage/appbar_widget.dart';
import 'package:srbs/views/pages/homepage/recent_transactions.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBarWidget(size: size),
        body: Container(
          height: size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.backGroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: RefreshIndicator(
            onRefresh: () async {
              await homeController.fetchHomescreendata();
            },
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
                    RecentTransactions(controller: homeController, size: size),
                    const SizedBox(height: 20),
                    Obx(() => homeController.isLoading.value
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            decoration: BoxDecoration(
                              color: ColorPalette.backGroundColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: SkeletonListTile(
                                  hasLeading: false,
                                )))
                        : GestureDetector(
                            onTap: () {
                              Get.dialog(
                                DonationCard(
                                  size: size,
                                  donationDetails:
                                      homeController.donationTypeList,
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
                          )),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
