import 'dart:typed_data';

import 'package:srbs/constants/import_packages.dart';

class EventData {
  String? eventId;
  DateTime? startDate;
  DateTime? endDate;
  String? venue;
  DateTime? time;
  Uint8List? inviationImage;
  Uint8List? pdffile;
  EventType? eventType;
  EventData({
    this.eventId,
    this.startDate,
    this.endDate,
    this.venue,
    this.time,
    this.inviationImage,
    this.pdffile,
    this.eventType,
  });

  @override
  String toString() {
    return 'EventData(eventId: $eventId, startDate: $startDate, endDate: $endDate, venue: $venue, time: $time, eventType: $eventType)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'eventId': eventId,
      'startDate': startDate?.millisecondsSinceEpoch,
      'endDate': endDate?.millisecondsSinceEpoch,
      'venue': venue,
      'time': time?.millisecondsSinceEpoch,
      'eventType': eventType,
    };
  }

  factory EventData.fromMap(Map<String, dynamic> map) {
    return EventData(
      eventId: map['_id'] != null ? map['_id'] as String : null,
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
      venue: map['venue'] != null ? map['venue'] as String : null,
      time: DateTime.parse(map['time']),
      inviationImage: base64Decode(map['invitation']),
      pdffile: base64Decode(map['program_paper']),
      eventType: EventType(
          id: map['eventType']['_id'].toString(),
          title: map['eventType']['title'].toString(),
          duration: map['eventType']['duration'].toString(),
          description: map['eventType']['description'].toString()),
    );
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
