// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:intl/intl.dart';
import 'package:srbs/constants/import_packages.dart';

class GalleryImagesData {
  String imageId;
  Uint8List image;
  DateTime timeStamp;
  GalleryImagesData({
    required this.imageId,
    required this.image,
    required this.timeStamp,
  });

  factory GalleryImagesData.fromMap(Map<String, dynamic> map) {
    String stamp = DateFormat('yyyy-MM-dd').format(
      DateTime.parse(map['createdAt'].toString()),
    ); // convert string to datetime and formated into only take date from the timestamp.
    return GalleryImagesData(
      imageId: map['id'].toString(),
      image: base64Decode(map['image']),
      timeStamp: DateTime.parse(stamp.toString()),
    );
  }

  @override
  String toString() =>
      'GalleryImagesData(imageId: $imageId, image: $image, timeStamp: $timeStamp)';
}
