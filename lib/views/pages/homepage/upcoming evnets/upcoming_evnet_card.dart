import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:srbs/Controllers/home%20Controllers/home_controller.dart';
import 'package:srbs/constants/import_packages.dart';

import '../../events/event_view_page.dart';

class UpcomingEvnetCard extends StatelessWidget {
  final Size size;
  final HomeController controller;
  const UpcomingEvnetCard(
      {super.key, required this.size, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...controller.upcoimgEvents.map(
          (event) => GestureDetector(
            onTap: () {
              Get.to(() => EventViewPage(eventDetails: event));
            },
            child: Container(
              clipBehavior: Clip.hardEdge,
              margin: const EdgeInsets.all(2),
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
                    filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: size.height * 0.1,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            gradient: ColorPalette.cardGradient,
                            boxShadow: [
                              BoxShadow(
                                color: ColorPalette.greyColor.withOpacity(0.7),
                                offset: const Offset(0, 0),
                                blurRadius: 4,
                              )
                            ]),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        event.eventType!.title.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.calendar_month,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "${event.startDate} - ${event.endDate}",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 11,
                                            color:
                                                Colors.white.withOpacity(0.85),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.timer,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          event.time.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 11,
                                            color:
                                                Colors.white.withOpacity(0.85),
                                            fontWeight: FontWeight.w400,
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
                              margin: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                  gradient: ColorPalette.secondaryGrdient,
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: Colors.white)),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(CupertinoIcons.location,
                                      size: 20, color: Colors.white),
                                  Text(
                                    'Get\ndirections',
                                    textAlign: TextAlign.center,
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
    );
  }
}
