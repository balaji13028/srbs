import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';
import 'package:srbs/Controllers/home%20Controllers/home_controller.dart';
import 'package:srbs/Models/events.%20models/event_data.dart';
import 'package:srbs/views/pages/events/events_page.dart';

import '../../../constants/import_packages.dart';

class UpcoimgEvents extends StatelessWidget {
  final HomeController controller;
  const UpcoimgEvents({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(() => controller.isLoading.value
        ? Expanded(
            child: Container(
              width: size.width,
              padding: const EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: ColorPalette.backGroundColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: AppDefaults.defaultBoxShadow,
              ),
              child: SkeletonListView(),
            ),
          )
        : controller.upcoimgEvents.isEmpty
            ? const SizedBox()
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
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Upcoming Events',
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: ColorPalette.lightprimaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemCount: controller.upcoimgEvents.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            EventData event = controller.upcoimgEvents[index];
                            return Container(
                              width: size.width,
                              height: size.height * 0.13,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    clipBehavior: Clip.hardEdge,
                                    height: size.height,
                                    alignment: Alignment.center,
                                    width: size.width * 0.2,
                                    decoration: BoxDecoration(
                                      gradient: ColorPalette.primaryGradient,
                                    ),
                                    child:
                                        Image.asset(AppImages.invitaionImage),
                                  ),
                                  // EventInvitationCard(
                                  //   size: size,
                                  //   event: event,
                                  //   parseDate: parseDate,
                                  // ),
                                  SizedBox(width: size.width * 0.03),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              event.eventType!.title.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorPalette
                                                      .primaryColor),
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              event.eventType!.description
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Icon(
                                                Icons.calendar_month,
                                                size: 14,
                                                color:
                                                    ColorPalette.primaryColor,
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                AppDefaults().dateFormat(
                                                    event.startDate),
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 11,
                                                    color: ColorPalette
                                                        .primaryColor,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Icon(
                                                Icons.calendar_month,
                                                size: 14,
                                                color:
                                                    ColorPalette.primaryColor,
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                AppDefaults()
                                                    .dateFormat(event.endDate),
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 11,
                                                    color: ColorPalette
                                                        .primaryColor,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ))
                  ],
                ),
              ));
  }
}
