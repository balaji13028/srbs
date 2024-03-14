import 'package:get/get.dart';
import 'package:srbs/Controllers/event/event_controller.dart';
import 'package:srbs/Models/events.%20models/event_data.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/views/pages/events/event_view_page.dart';
import 'package:srbs/views/widgets/skeleton%20loading/event_card.dart';

class EventPage extends StatelessWidget {
  EventPage({super.key});

  final controller = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ColorPalette.backGroundColor,
        appBar: AppBar(
          title: const Text('Events'),
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: RefreshIndicator(
              onRefresh: () async {
                await controller.fetchEvents();
              },
              child: Obx(
                () => controller.isloading.value
                    ? EventSkeletonSample(size: size)
                    : controller.eventList.isEmpty
                        ? const Center(
                            child: Text('No Events'),
                          )
                        : ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                            itemCount: controller.eventList.length,
                            itemBuilder: (context, index) {
                              EventData event = controller.eventList[index];
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                      () => EventViewPage(eventDetails: event));
                                },
                                child: Container(
                                    padding: const EdgeInsets.only(left: 5),
                                    height: size.width * 0.28,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: AppDefaults.defaultBoxShadow,
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            clipBehavior: Clip.hardEdge,
                                            height: size.height,
                                            alignment: Alignment.center,
                                            width: size.width * 0.2,
                                            decoration: const BoxDecoration(
                                                // gradient: ColorPalette
                                                //     .primaryGradient,
                                                // borderRadius: BorderRadius.circular(4),
                                                ),
                                            child: Image.memory(
                                              event.inviationImage!,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          SizedBox(width: size.width * 0.03),
                                          Expanded(
                                              child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    event.eventType!.title
                                                        .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: ColorPalette
                                                            .primaryColor),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    event.eventType!.description
                                                        .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w300,
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
                                                      color: ColorPalette
                                                          .primaryColor,
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Text(
                                                      "${event.startDate} - ${event.endDate}",
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                                                      Icons.timer,
                                                      size: 14,
                                                      color: ColorPalette
                                                          .primaryColor,
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Text(
                                                      event.time.toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                                          ))
                                        ])),
                              );
                            }),
              ),
            )));
  }
}
