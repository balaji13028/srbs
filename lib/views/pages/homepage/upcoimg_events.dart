import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:srbs/Controllers/home%20Controllers/home_controller.dart';
import 'package:srbs/views/pages/events/event_view_page.dart';
import 'package:srbs/views/pages/events/events_page.dart';
import 'package:srbs/views/widgets/skeleton%20loading/event_card.dart';

import '../../../constants/import_packages.dart';

class UpcoimgEvents extends StatelessWidget {
  final HomeController controller;
  const UpcoimgEvents({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => controller.isLoading.value
          ? loadingAnimation(size)
          : Container(
              width: size.width,
              padding: const EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: ColorPalette.backGroundColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: AppDefaults.defaultBoxShadow,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 15),
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
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EventPage(),
                              )),
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
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorPalette.lightprimaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: controller.upcoimgEvents.isEmpty
                        ? const Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            child: Center(
                              child: Text('No Events'),
                            ),
                          )
                        : Column(
                            children: [
                              ...controller.upcoimgEvents.map(
                                (event) => GestureDetector(
                                  onTap: () {
                                    Get.to(() =>
                                        EventViewPage(eventDetails: event));
                                  },
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    margin: const EdgeInsets.all(0.5),
                                    width: double.infinity,
                                    height: size.height * 0.28,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Stack(
                                      children: [
                                        Image.memory(
                                          event.inviationImage!,
                                          width: double.infinity,
                                          height: size.height,
                                          fit: BoxFit.fill,
                                        ),
                                        BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 1, sigmaY: 1),
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              height: size.height * 0.1,
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                  gradient:
                                                      ColorPalette.cardGradient,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: ColorPalette
                                                          .primaryColor
                                                          .withOpacity(0.7),
                                                      offset:
                                                          const Offset(0, 0),
                                                      blurRadius: 4,
                                                    )
                                                  ]),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                              event.eventType!
                                                                  .title
                                                                  .toString(),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 2,
                                                              style: const TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Icon(
                                                                Icons
                                                                    .calendar_month,
                                                                size: 14,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              const SizedBox(
                                                                  width: 5),
                                                              Text(
                                                                "${event.startDate} - ${event.endDate}",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 11,
                                                                  color: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.85),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Icon(
                                                                Icons.timer,
                                                                size: 14,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              const SizedBox(
                                                                  width: 5),
                                                              Text(
                                                                event.time
                                                                    .toString(),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 11,
                                                                  color: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.85),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: size.height * 0.06,
                                                    width: size.width * 0.15,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 20),
                                                    decoration: BoxDecoration(
                                                        gradient: ColorPalette
                                                            .secondaryGrdient,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                        border: Border.all(
                                                            color:
                                                                Colors.white)),
                                                    child: const Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                            CupertinoIcons
                                                                .location,
                                                            size: 20,
                                                            color:
                                                                Colors.white),
                                                        Text(
                                                          'Get\ndirections',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 8,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                  )
                ],
              ),
            ),
    );
  }

  Expanded loadingAnimation(Size size) {
    return Expanded(
      child: Container(
          width: size.width,
          padding: const EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            color: ColorPalette.backGroundColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: AppDefaults.defaultBoxShadow,
          ),
          child: EventSkeletonSample(size: size)),
    );
  }
}
