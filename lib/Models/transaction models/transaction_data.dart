// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TransactionData {
  String? transId;
  String? donationName;
  String? description;
  String? forname;
  String? gothram;
  int? amount;
  DateTime? timeStamp;
  String? orderId;
  String? paymentStatus;
  String? paymentId;
  TransactionData({
    this.transId,
    this.donationName,
    this.description,
    this.forname,
    this.gothram,
    this.amount,
    this.paymentId,
    this.orderId,
    this.paymentStatus,
    this.timeStamp,
  });

  @override
  String toString() {
    return 'TransactionData(transId: $transId, donationName: $donationName, description: $description, forname: $forname, gothram: $gothram, amount: $amount, timeStamp: $timeStamp, orderId: $orderId, paymentStatus: $paymentStatus, paymentId: $paymentId)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'transId': transId,
      'donationName': donationName,
      'description': description,
      'forname': forname,
      'gothram': gothram,
      'amount': amount,
      'timeStamp': timeStamp?.millisecondsSinceEpoch,
      'orderId': orderId,
      'paymentStatus': paymentStatus,
      'paymentId': paymentId,
    };
  }

  factory TransactionData.fromMap(Map<String, dynamic> map) {
    return TransactionData(
      transId: map['_id'] != null ? map['_id'] as String : null,
      donationName:
          map['donationName'] != null ? map['donationName'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      forname: map['for'] != null ? map['for'] as String : null,
      gothram: map['gothram'] != null ? map['gothram'] as String : null,
      amount: map['amount'] != null ? map['amount'] as int : null,
      timeStamp: DateTime.parse(map['createdAt']),
      orderId: map['order_id'] != null ? map['order_id'] as String : null,
      paymentStatus: map['payment_status'].toString(),
      paymentId: map['payment_id'] != null ? map['payment_id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());
}
