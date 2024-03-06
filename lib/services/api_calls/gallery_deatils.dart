import 'package:http/http.dart' as http;
import 'package:srbs/Models/gallery%20models/galleryimages_data.dart';

import '../../constants/import_packages.dart';

class GalleryDetails {
  //Get Images
  Future getImages() async {
    try {
      final response =
          await http.get(Uri.parse('${AppConfig.normalUrl}/images'));
      // if (response.) ;
      if (response.statusCode == 200) {
        List<dynamic> map = jsonDecode(response.body)['images'];
        // print(map);
        // return [];
        return map.map((e) => GalleryImagesData.fromMap(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
