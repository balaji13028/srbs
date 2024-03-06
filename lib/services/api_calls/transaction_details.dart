import 'dart:convert';
import 'dart:developer';

import 'package:srbs/Models/transaction%20models/donation_type.dart';
import 'package:srbs/Models/transaction%20models/transaction_data.dart';

import '../../constants/import_packages.dart';
import 'package:http/http.dart' as http;

class TransactionDetails {
  // Get all transactions.
  Future getTransactions() async {
    try {
      final response = await http.get(
        Uri.parse(
            '${AppConfig.normalUrl}/transactions/userid/${userController.user.value.userId}'),
      );
      if (response.statusCode == 200) {
        log(response.body);
        List<dynamic> map = jsonDecode(response.body)['data'];
        return List.generate(
          map.length,
          (index) => TransactionData(
            transId: map[index]['_id'].toString(),
            forname: map[index]['for'].toString(),
            gothram: map[index]['gothram'].toString(),
            amount: map[index]['amount'],
            donationName: map[index]['donationName'].toString(),
            timeStamp: DateTime.parse(map[index]['createdAt']),
            donationType: DonationType(
                title: map[index]['donationType']['title'].toString(),
                description:
                    map[index]['donationType']['description'].toString(),
                amount: map[index]['donationType']['amount'] ?? 0),
          ),
        );
      } else {
        log(response.body);
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
