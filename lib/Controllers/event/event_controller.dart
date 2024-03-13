import 'package:get/get.dart';
import 'package:srbs/Models/events.%20models/event_data.dart';
import 'package:srbs/services/api_calls/event_details.dart';

class EventController extends GetxController {
  var isloading = false.obs;
  var eventList = <EventData>[].obs;

  @override
  void onInit() {
    fetchEvents();
    super.onInit();
  }

  fetchEvents() async {
    eventList.value = [];
    try {
      isloading(true);
      var data = await EventDeatils().getEvents();
      if (data != null) {
        eventList.value = data;
      }
    } finally {
      isloading(false);
    }
  }
}
