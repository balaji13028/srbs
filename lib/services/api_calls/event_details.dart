import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:srbs/Models/events.%20models/event_data.dart';

import '../../constants/import_packages.dart';

class EventDeatils {
  //get evnets details.
  Future getEvents() async {
    try {
      var response = await http.get(Uri.parse('${AppConfig.baseUrl}/events'));
      if (response.statusCode == 200) {
        // log(response.body);
        List<dynamic> map = jsonDecode(response.body)['data'];
        return map.map((e) => EventData.fromMap(e)).toList();
      } else {
        log(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
