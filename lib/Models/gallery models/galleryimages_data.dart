// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:srbs/constants/import_packages.dart';

class GalleryImagesData {
  String imageId;
  Uint8List image;
  GalleryImagesData({
    required this.imageId,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageId': imageId,
      'image': image,
    };
  }

  factory GalleryImagesData.fromMap(Map<String, dynamic> map) {
    return GalleryImagesData(
      imageId: map['id'].toString(),
      image: base64Decode(map['image']),
    );
  }

  @override
  String toString() => 'GalleryImagesData(imageId: $imageId, image: $image)';
}
