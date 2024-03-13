import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../constants/import_packages.dart';

class LoginDetails {
  /// Get OTP from server.
  Future getOTP(mobileNumber) async {
    Map<String, dynamic> data = {'mobileNumber': mobileNumber};
    try {
      final response = await http.post(
        Uri.parse('${AppConfig.baseUrl}/generateOtp'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        log(response.body);
        return jsonDecode(response.body)['otp'].toString();
      } else {
        log(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// verify OTP.
  Future verifyOTP(mobileNumber, otp) async {
    var data = {"mobileNumber": mobileNumber, "otp": otp};

    try {
      final response = await http.post(
        Uri.parse(
          '${AppConfig.baseUrl}/login',
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        // log(response.body);
        return jsonDecode(response.body);
      } else {
        log(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Create a account.
  Future createAccount(Map<String, dynamic> data) async {
    // try {
    final response = await http.post(
      Uri.parse(
        '${AppConfig.baseUrl}/add',
      ),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      // log(response.body);
      return UserData.fromMap(jsonDecode(response.body)['data'][0]);
    } else {
      log(response.body);
    }
    // } catch (e) {
    //   debugPrint(e.toString());
    // }
  }
}
