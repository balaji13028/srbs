import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';
import 'package:srbs/Controllers/gallery%20/gallery_controller.dart';
import 'package:srbs/Models/gallery%20models/galleryimages_data.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/views/pages/gallery/view_image.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GalleryController(), permanent: true);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPalette.backGroundColor,
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
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.fetchImages();
        },
        child: Obx(
          () => controller.isloading.value
              ? loadingAnimation()
              : controller.galleryImages.isEmpty
                  ? const Center(
                      child: Text('No Images'),
                    )
                  : ListTileTheme(
                      dense: true,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.uploadedDates.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Date
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 10, bottom: 5),
                                  child: Text(
                                    AppDefaults().dayFormat(
                                        controller.uploadedDates[index]),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      inherit: true,
                                    ),
                                  ),
                                ),
                                //images
                                imagesList(
                                  controller,
                                  size,
                                  controller.galleryImages
                                      .where((image) =>
                                          image.timeStamp ==
                                          controller.uploadedDates[index])
                                      .toList(),
                                ),
                              ],
                            );
                          }),
                    ),
        ),
      ),
    );
  }

  GridView imagesList(GalleryController controller, Size size, var list) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 3,
        crossAxisSpacing: 3,
      ),
      itemBuilder: (context, index) {
        GalleryImagesData gallery = list[index];
        return GestureDetector(
          onTap: () {
            Get.to(
              () => ViewImage(
                size: size,
                imageDetails: gallery,
                controller: controller,
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  blurRadius: 1,
                  color: Colors.grey.shade300,
                )
              ],
            ),
            child: Image.memory(
              gallery.image,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  GridView loadingAnimation() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (context, index) => const SkeletonAvatar(),
    );
  }
}
