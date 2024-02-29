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
        log(response.body);
        Map<String, dynamic> map = jsonDecode(response.body);
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
    try {
      final response = await http.post(
        Uri.parse(
          '${AppConfig.baseUrl}/add',
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        log(response.body);
        Map<String, dynamic> map = jsonDecode(response.body);
        // return UserData(
        //   userId: map['_id'].toString(),
        //   userName: map['userName'].toString(),
        //   mobileNumber: map['mobileNumber'].toString(),
        //   gender: map['gender'].toString(),
        //   gothram: map['gothram'].toString(),
        //   firstName: map['firstName'].toString(),
        //   lastName: map['lastName'].toString(),
        //   address: map['address'].toString(),
        // );

        return jsonDecode(response.body);
      } else {
        log(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
