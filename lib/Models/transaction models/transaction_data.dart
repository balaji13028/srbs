import 'package:srbs/Models/transaction%20models/donation_type.dart';

class TransactionData {
  String? transId;
  DonationType? donationType;
  String? donationName;
  String? description;
  String? forname;
  String? gothram;
  int? amount;
  DateTime? timeStamp;
  TransactionData({
    this.transId,
    this.donationType,
    this.donationName,
    this.description,
    this.forname,
    this.gothram,
    this.amount,
    this.timeStamp,
  });

  @override
  String toString() {
    return 'TransactionData(transId: $transId, donationType: $donationType, donationName: $donationName, description: $description, forname: $forname, gothram: $gothram, amount: $amount,timestamp:$timeStamp)';
  }
}
