import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';
import 'package:srbs/views/pages/profile/profile_screen.dart';

import '../../../constants/import_packages.dart';

class ProfileCard extends StatelessWidget {
  final Size size;
  const ProfileCard({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => userController.isprofileLoading.value
          ? Container(
              clipBehavior: Clip.none,
              width: size.width,
              padding: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: ColorPalette.backGroundColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: AppDefaults.defaultBoxShadow,
              ),
              child: SkeletonListTile(
                contentSpacing: 15,
                hasSubtitle: true,
                padding: const EdgeInsets.all(10),
              ))
          : GestureDetector(
              onTap: () {
                Get.to(() => const ProfileScreen());
              },
              child: Container(
                clipBehavior: Clip.none,
                width: size.width,
                padding: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: ColorPalette.backGroundColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: AppDefaults.defaultBoxShadow,
                ),
                child: Column(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          gradient: ColorPalette.secondaryGrdient,
                          borderRadius: BorderRadius.circular(8)),
                      child: Container(
                        margin: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.only(left: 5, right: 10),
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
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          subtitle: Text(
                            userController.user.value.mobileNumber.toString(),
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: size.width * 0.1,
                                height: size.width * 0.08,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: userController
                                                  .user.value.profileStatus ==
                                              '100%'
                                          ? ColorPalette.darkGreenColor
                                          : ColorPalette.secondaryColor,
                                      width: 0.5),
                                  shape: BoxShape.circle,
                                ),
                                child: userController
                                            .user.value.profileStatus ==
                                        '100%'
                                    ? const Icon(
                                        Icons.check,
                                        size: 18,
                                        color: ColorPalette.darkGreenColor,
                                      )
                                    : const Text(
                                        '!',
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color: ColorPalette.secondaryColor,
                                        ),
                                      ),
                              ),
                              const SizedBox(height: 4),
                              Visibility(
                                visible:
                                    userController.user.value.profileStatus ==
                                            '100%'
                                        ? false
                                        : true,
                                child: const Text(
                                  'profile\nIncomplete',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 6,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Profile Status:',
                            style: TextStyle(
                              fontSize: 10,
                              height: 1,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${userController.user.value.profileStatus}',
                            style: const TextStyle(
                              fontSize: 14,
                              height: 0.8,
                              fontWeight: FontWeight.w500,
                              color: ColorPalette.darkGreenColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
