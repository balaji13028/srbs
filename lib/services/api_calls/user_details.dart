import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:srbs/constants/import_packages.dart';

class UserDetails {
  // fetch user Details to sent userid.
  Future getUserDetails(userId) async {
    try {
      final response =
          await http.get(Uri.parse('${AppConfig.baseUrl}/userid/$userId'));
      if (response.statusCode == 200) {
        return UserData.fromMap(jsonDecode(response.body));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Update user Details by one by one.
  Future updateUserDetails(String key, value) async {
    Map<String, dynamic> data = {key: value};

    try {
      final response = await http.patch(
          Uri.parse(
              '${AppConfig.baseUrl}/update/${userController.user.value.userId}'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(data));
      if (response.statusCode == 200) {
        log(response.body);
        return jsonDecode(response.body)['message'];
      } else {
        log(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
