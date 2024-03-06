import 'package:srbs/Controllers/gallery%20/gallery-controller.dart';
import 'package:srbs/constants/import_packages.dart';

class ViewImage extends StatelessWidget {
  final Size size;
  final Uint8List imagePath;
  final GalleryController controller;
  const ViewImage(
      {super.key,
      required this.size,
      required this.imagePath,
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
              imagePath,
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
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
