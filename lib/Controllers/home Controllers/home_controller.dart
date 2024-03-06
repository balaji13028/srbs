import 'dart:developer';

import 'package:get/state_manager.dart';
import 'package:srbs/Models/events.%20models/event_data.dart';
import 'package:srbs/Models/transaction%20models/donation_type.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var isLoading = false.obs;
  var upcoimgEvents = <EventData>[].obs;
  var donationTypeList = <DonationType>[].obs;

  @override
  void onInit() {
    fetchHomescreendata();
    super.onInit();
  }

  fetchHomescreendata() async {
    try {
      isLoading(true);
      userController.isprofileLoading(true);
      var data = await homeDataApi();
      if (data != null) {
        donationTypeList.value = data;
      }
    } finally {
      isLoading(false);
      userController.isprofileLoading(false);
    }
  }

  Future homeDataApi() async {
    try {
      final response = await http.get(Uri.parse('${AppConfig.baseUrl}/home'));
      if (response.statusCode == 200) {
        // Upcoming events list.
        List<dynamic> evnets = jsonDecode(response.body)['upcomingEvents'];
        upcoimgEvents.value = evnets.map((e) => EventData.fromMap(e)).toList();

        // donation details.
        List<dynamic> donations = jsonDecode(response.body)['donationTypes'];
        return donations.map((e) => DonationType.fromMap(e)).toList();
      } else {
        log(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
