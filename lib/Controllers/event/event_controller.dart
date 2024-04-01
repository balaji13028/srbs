import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:srbs/Models/events.%20models/event_data.dart';
import 'package:srbs/services/api_calls/event_details.dart';

class EventController extends GetxController {
  var isloading = false.obs;
  var eventList = <EventData>[].obs;
  var upcomingeventList = <EventData>[].obs;
  var completedeventList = <EventData>[].obs;

  @override
  void onInit() {
    fetchEvents();
    super.onInit();
  }

  fetchEvents() async {
    eventList.value = [];
    upcomingeventList.clear();
    completedeventList.clear();
    try {
      isloading(true);
      var data = await EventDeatils().getEvents();
      if (data != null) {
        eventList.value = data;
        eventList.map((element) => filterEvents(element)).toList();
      }
    } finally {
      isloading(false);
    }
  }

  /// Filter Events to upcoming and past.
  filterEvents(EventData event) async {
    DateTime today = DateTime.now();

    DateTime endparseDate =
        DateFormat('dd/MM/yyyy').parse(event.endDate.toString());

    if (endparseDate.difference(today).inDays < 0) {
      return completedeventList.add(event);
    } else {
      return upcomingeventList.add(event);
    }
  }
}
