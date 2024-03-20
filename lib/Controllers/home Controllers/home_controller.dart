import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:srbs/Models/events.%20models/event_data.dart';
import 'package:srbs/Models/transaction%20models/donation_type.dart';
import 'package:srbs/Models/transaction%20models/transaction_data.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/services/provider/shared_preference.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var upcoimgEvents = <EventData>[].obs;
  var donationTypeList = <DonationType>[].obs;
  var recentTransactions = <TransactionData>[].obs;

  @override
  void onInit() {
    fetchHomescreendata();
    super.onInit();
  }

  fetchHomescreendata() async {
    // donationTypeList.clear();
    // upcoimgEvents.clear();
    // try {
    isLoading(true);
    userController.isprofileLoading(true);
    //   var data = await homeDataApi();
    //   if (data != null) {
    //     donationTypeList.value = data;
    //   }
    // } finally {
    //   isLoading(false);
    //   userController.isprofileLoading(false);
    // }
  }

  Future<void> logout() async {
    SharedPreferencesService prefs = SharedPreferencesService.to;
    // Clear authentication status in shared preferences
    prefs.setboolData('isAuthenticated', false);
    prefs.clearAllData();
    Get.offAll(() => LoginScreen()); // Navigate to login page
  }

  Future homeDataApi() async {
    try {
      final response = await http.get(
        Uri.parse(
            '${AppConfig.baseUrl}/home/${userController.user.value.userId}'),
      );
      if (response.statusCode == 200) {
        // Upcoming events list.
        List<dynamic> evnets = jsonDecode(response.body)['upcomingEvents'];
        upcoimgEvents.value = evnets.map((e) => EventData.fromMap(e)).toList();

        // donation details.
        List<dynamic> transactions = jsonDecode(response.body)['transactions'];
        recentTransactions.value =
            transactions.map((e) => TransactionData.fromMap(e)).toList();

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
