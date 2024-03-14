import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:srbs/Models/events.%20models/event_data.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/utils/buttons.dart';
import 'package:srbs/views/pages/events/view_invitation.dart';

class EventViewPage extends StatelessWidget {
  final EventData eventDetails;
  const EventViewPage({super.key, required this.eventDetails});

  @override
  Widget build(BuildContext context) {
    var viewpaper = false.obs;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(eventDetails.eventType!.title.toString()),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: ColorPalette.primaryColor,
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              width: size.width * 0.52,
              height: size.height * 0.35,
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: AppDefaults.defaultBoxShadow,
              ),
              child: GestureDetector(
                  onTap: () async {
                    Get.to(() => ViewInvitation(
                          inviationImage: eventDetails.inviationImage!,
                          size: size,
                        ));
                  },
                  child: Image.memory(
                    eventDetails.inviationImage!,
                    fit: BoxFit.cover,
                  )),
            ),
          ],
        ),
      ),
      bottomSheet: DraggableScrollableSheet(
        initialChildSize: 0.55,
        maxChildSize: 1,
        minChildSize: 0.55,
        expand: false,
        builder: (context, scrollController) => Container(
          height: size.height,
          padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: SingleChildScrollView(
            controller: scrollController,
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 5,
                      width: size.width * 0.1,
                      decoration: BoxDecoration(
                          color: ColorPalette.greyColor,
                          borderRadius: BorderRadius.circular(size.height)),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  'Description :',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.black54),
                ),
                const SizedBox(height: 10),
                Text(
                  eventDetails.eventType!.description,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_month),
                        const SizedBox(width: 10),
                        Text(
                          '${eventDetails.startDate} - ${eventDetails.endDate}',
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.timer),
                        const SizedBox(width: 10),
                        Text(
                          eventDetails.time.toString(),
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.black),
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(Icons.location_on_rounded),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        '${eventDetails.venue}',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                Buttons().secondaryGradientButton(
                  width: size.width,
                  height: size.width * 0.12,
                  fontSize: 18,
                  borderRadius: 4,
                  text: 'View program paper',
                  onTap: () async {
                    try {
                      if (viewpaper.value == false) {
                        viewpaper(true);
                        showDialog(
                          context: Get.context!,
                          barrierDismissible: true,
                          builder: (context) => const Center(
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                        await createPdf(
                          eventDetails.pdffile,
                          eventDetails.eventType!.title,
                        ).then((value) => Navigator.pop(context));
                      } else {
                        await createPdf(
                          eventDetails.pdffile,
                          eventDetails.eventType!.title,
                        );
                      }
                    } catch (e) {
                      debugPrint(e.toString());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future createPdf(imagePath, String eventName) async {
    Uint8List bytes = imagePath;
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/$eventName.pdf");
    await file.writeAsBytes(bytes.buffer.asUint8List());

    await OpenFilex.open("${output.path}/$eventName.pdf");
  }
}
