import 'package:get/get.dart';
import 'package:srbs/Controllers/event/event_controller.dart';
import 'package:srbs/Models/events.%20models/event_data.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/views/pages/events/event_card.dart';
import 'package:srbs/views/widgets/skeleton%20loading/events_loading.dart';

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
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.fetchEvents();
        },
        child: Container(
          height: size.height,
          width: size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.backGroundImage),
                fit: BoxFit.cover,
                opacity: 0.5),
          ),
          child: Obx(
            () => controller.isloading.value
                ? EventLoading(size: size)
                : controller.eventList.isEmpty
                    ? const Center(
                        child: Text('No Events'),
                      )
                    : ListView(
                        children: [
                          const SizedBox(height: 15),
                          Text(
                            'Upcoming / Ongoing Events',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: ColorPalette.labelTextColorgrey,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ListTileTheme.merge(
                            dense: true,
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: controller.upcomingeventList.length,
                              itemBuilder: (context, index) {
                                EventData event =
                                    controller.upcomingeventList[index];
                                return EventCard(
                                  size: size,
                                  event: event,
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Completed Events',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: ColorPalette.labelTextColorgrey,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ListTileTheme.merge(
                            dense: true,
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: controller.completedeventList.length,
                              itemBuilder: (context, index) {
                                EventData event =
                                    controller.completedeventList[index];
                                return EventCard(
                                  size: size,
                                  event: event,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}
