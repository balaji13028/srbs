import 'package:get/get.dart';
import 'package:srbs/Models/gallery%20models/galleryimages_data.dart';
import 'package:srbs/services/api_calls/gallery_details.dart';

class GalleryController extends GetxController {
  var isloading = false.obs;
  var galleryImages = <GalleryImagesData>[].obs;
  var uploadedDates = [].obs;
  var appBarVisible = true.obs;

  @override
  void onInit() {
    fetchImages();
    super.onInit();
  }

  fetchImages() async {
    galleryImages.value = [];
    uploadedDates.clear();
    try {
      isloading(true);
      var images = await GalleryDetails().getImages();

      if (images != null) {
        galleryImages.value = images;
        filterDates();
      }
    } finally {
      isloading(false);
    }
  }

  /// Take the only dates from images and remove the duplicated dates.
  filterDates() {
    var dates = galleryImages.map((element) => element.timeStamp).toList();
    uploadedDates.value = dates.toSet().toList();
  }
}
