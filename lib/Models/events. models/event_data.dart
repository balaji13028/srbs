// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:srbs/constants/import_packages.dart';

class EventData {
  String? eventId;
  String? startDate;
  String? endDate;
  String? venue;
  String? time;
  Uint8List? inviationImage;
  Uint8List? pdffile;
  EventType? eventType;
  String? latitude;
  String? longtude;
  EventData({
    this.eventId,
    this.startDate,
    this.endDate,
    this.venue,
    this.time,
    this.inviationImage,
    this.pdffile,
    this.eventType,
    this.latitude,
    this.longtude,
  });

  factory EventData.fromMap(Map<String, dynamic> map) {
    List<String> coordinates =
        map['coordinates'].toString().split(',').toList();
    return EventData(
      eventId: map['_id'] != null ? map['_id'] as String : null,
      startDate: map['startDate'],
      endDate: map['endDate'],
      venue: map['venue'] != null ? map['venue'] as String : null,
      time: map['time'],
      inviationImage: base64Decode(map['invitation']),
      pdffile: base64Decode(map['program_paper']),
      latitude: coordinates.first,
      longtude: coordinates.last,
      eventType: EventType(
          id: map['eventType']['_id'].toString(),
          title: map['eventType']['title'].toString(),
          duration: map['eventType']['duration'].toString(),
          description: map['eventType']['description'].toString()),
    );
  }

  @override
  String toString() {
    return 'EventData(eventId: $eventId, startDate: $startDate, endDate: $endDate, venue: $venue, time: $time, inviationImage: $inviationImage, pdffile: $pdffile, eventType: $eventType, latitude: $latitude, longtude: $longtude)';
  }
}

class EventType {
  String id;
  String title;
  String duration;
  String description;

  EventType({
    required this.id,
    required this.title,
    required this.duration,
    required this.description,
  });

  @override
  String toString() {
    return 'EventType(id: $id, title: $title, duration: $duration, description: $description)';
  }
}
