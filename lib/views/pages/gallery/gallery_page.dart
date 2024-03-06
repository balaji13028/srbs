import 'package:get/get.dart';
import 'package:srbs/Controllers/gallery%20/gallery-controller.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/views/pages/gallery/view_image.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GalleryController(), permanent: true);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.01),
        extendBody: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Gallery',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 0.9,
            ),
          ),
        ),
        body: Obx(
          () => controller.isloading.value
              ? const Center(child: CircularProgressIndicator.adaptive())
              : controller.galleryImages.isEmpty
                  ? const Center(
                      child: Text('No Images'),
                    )
                  : GridView.builder(
                      itemCount: controller.galleryImages.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Get.to(() => ViewImage(
                                    size: size,
                                    imagePath:
                                        controller.galleryImages[index].image,
                                    controller: controller,
                                  ));
                            },
                            child: Container(
                              height: size.width * 0.16,
                              width: size.width * 0.16,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 1,
                                        color: Colors.grey.shade300)
                                  ]),
                              child: Image.memory(
                                controller.galleryImages[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
        ));
  }
}
