import 'package:get/get.dart';
import 'package:srbs/constants/import_packages.dart';

class SharedPreferencesService extends GetxService {
  static SharedPreferencesService get to => Get.find();

  late SharedPreferences _prefs;

  Future<void> initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Save user details in local-db.
  Future<void> saveUserData(String value) async {
    await _prefs.setString('userData', value.toString());
  }

  /// Store login status.
  Future<void>? setboolData(String key, bool value) {
    return _prefs.setBool(key, value);
  }

  /// Get stored value by key.
  String? getData(String key) {
    return _prefs.getString(key);
  }

  /// Get stored login status by key.
  bool? getboolData(String key) {
    return _prefs.getBool(key);
  }

  /// Get user details from local-db.
  UserData? getUserData() {
    var jsonDeatils = jsonDecode(_prefs.getString('userData')!);
    if (jsonDeatils != null) {
      return UserData.fromMap(jsonDecode(jsonDeatils));
    } else {
      return null;
    }
  }

  /// Check key availble or not in db.
  bool? isContinekey(String key) {
    return _prefs.containsKey(key);
  }

  // clear stored value by key..
  Future<void> clearData(String key) async {
    await _prefs.remove(key);
  }

  // Delete all data from local-db.
  Future<void> clearAllData() async {
    await _prefs.clear();
  }
}
