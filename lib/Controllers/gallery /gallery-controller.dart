import 'package:get/get.dart';
import 'package:srbs/Models/gallery%20models/galleryimages_data.dart';
import 'package:srbs/services/api_calls/gallery_deatils.dart';

class GalleryController extends GetxController {
  var isloading = false.obs;
  var galleryImages = <GalleryImagesData>[].obs;
  var appBarVisible = true.obs;

  @override
  void onInit() {
    fetchImages();
    super.onInit();
  }

  fetchImages() async {
    galleryImages.value = [];
    try {
      isloading(true);
      var images = await GalleryDetails().getImages();
      if (images != null) {
        galleryImages.value = images;
      }
    } finally {
      isloading(false);
    }
  }
}
