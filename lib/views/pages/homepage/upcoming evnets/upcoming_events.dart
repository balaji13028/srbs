import 'package:srbs/Controllers/home%20Controllers/home_controller.dart';
import 'package:srbs/views/pages/events/events_page.dart';
import 'package:srbs/views/pages/homepage/upcoming%20evnets/upcoming_evnet_card.dart';
import 'package:srbs/views/widgets/skeleton%20loading/upcoimg_event_loading.dart';

import '../../../../constants/import_packages.dart';

class UpcomingEvents extends StatelessWidget {
  final HomeController controller;
  const UpcomingEvents({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => controller.isLoading.value
          ? UpcoimgEventLoading(size: size)
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
                        : UpcomingEvnetCard(size: size, controller: controller),
                  )
                ],
              ),
            ),
    );
  }
}
