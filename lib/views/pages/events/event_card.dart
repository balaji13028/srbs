import 'dart:ui';
import 'package:get/get.dart';
import 'package:srbs/Models/events.%20models/event_data.dart';
import 'package:srbs/views/pages/events/event_view_page.dart';
import '../../../constants/import_packages.dart';

class EventCard extends StatelessWidget {
  final Size size;
  final EventData event;
  const EventCard({super.key, required this.event, required this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => EventViewPage(eventDetails: event));
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: AppDefaults.defaultBoxShadow,
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
                  clipBehavior: Clip.hardEdge,
                  padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                  decoration: BoxDecoration(
                      gradient: ColorPalette.cardGradient,
                      boxShadow: [
                        BoxShadow(
                          color: ColorPalette.greyColor.withOpacity(0.7),
                          offset: const Offset(0, 0),
                          blurRadius: 4,
                        )
                      ]),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          event.eventType!.title.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                fontSize: 10,
                                color: Colors.white.withOpacity(0.85),
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                              fontSize: 10,
                              color: Colors.white.withOpacity(0.85),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
