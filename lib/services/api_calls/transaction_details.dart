import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:srbs/Models/transaction%20models/transaction_data.dart';

import '../../constants/import_packages.dart';

class TransactionDetails {
  // Get all transactions.
  Future getTransactions() async {
    try {
      final response = await http.get(
        Uri.parse(
            '${AppConfig.normalUrl}/transactions/userid/${userController.user.value.userId}'),
      );
      // log(response.body);
      if (response.statusCode == 200) {
        List<dynamic> map = jsonDecode(response.body)['data'];
        return map.map((e) => TransactionData.fromMap(e)).toList();
      } else {
        return <TransactionData>[];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future createTransaction(Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse('${AppConfig.normalUrl}/transactions/add'),
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
}
