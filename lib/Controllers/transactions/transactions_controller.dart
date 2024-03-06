import 'package:get/get.dart';
import 'package:srbs/Models/transaction%20models/transaction_data.dart';
import 'package:srbs/services/api_calls/transaction_details.dart';

class TransactionsController extends GetxController {
  var isloading = false.obs;
  var transactions = <TransactionData>[].obs;

  @override
  void onInit() {
    super.onInit();
    getTransactions();
  }

  getTransactions() async {
    transactions.value = [];
    try {
      isloading(true);
      var data = await TransactionDetails().getTransactions();
      if (data != null) {
        transactions.value = data.reversed.toList();
      } else {
        transactions.value = [];
      }
    } finally {
      isloading(false);
    }
  }
}
