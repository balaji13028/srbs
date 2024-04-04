import 'package:srbs/Controllers/gallery/gallery_controller.dart';
import 'package:srbs/Models/gallery%20models/galleryimages_data.dart';
import 'package:srbs/constants/import_packages.dart';

class ViewImage extends StatelessWidget {
  final Size size;
  final GalleryImagesData imageDetails;
  final GalleryController controller;
  const ViewImage(
      {super.key,
      required this.size,
      required this.imageDetails,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              controller.appBarVisible.value = !controller.appBarVisible.value;
            },
            child: Center(
                child: Image.memory(
              imageDetails.image,
              width: size.width,
              height: size.height,
            )),
          ),
          Obx(() => Visibility(
                visible: controller.appBarVisible.value,
                child: SizedBox(
                  height: 100,
                  child: AppBar(
                      backgroundColor: Colors.black.withOpacity(0.65),
                      automaticallyImplyLeading: true,
                      centerTitle: false,
                      title: Text(
                        AppDefaults().dayFormat(imageDetails.timeStamp),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      )),
                ),
              )),
        ],
      ),
    );
  }
}
