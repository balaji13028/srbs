import 'package:http/http.dart' as http;
import 'package:srbs/Models/user%20models/user_data.dart';
import 'package:srbs/constants/import_packages.dart';

class UserDetails {
  Future getUserDetails(userId) async {
    try {
      final response =
          await http.get(Uri.parse('${AppConfig.baseUrl}/userid/$userId'));
      if (response.statusCode == 200) {
        print(response.body);
        return UserData.fromJson(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
