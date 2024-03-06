import 'dart:developer';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:http/http.dart' as http;
import 'package:srbs/services/api_calls/transaction_details.dart';

class RazorpayIntegration extends GetxService {
  // Instance of razor pay
  late Razorpay razorpay;
  String apiKey = 'rzp_test_Iaa4Z2sjS0EDET';
  String apiSecret = 'h81ZCNTUYC1JELffEyO9f6i9';
  var image;
  Map<String, dynamic> serverResponse = {};
  String orderIdValue = "";

  @override
  void onInit() {
    loadImage();
    razorpay = Razorpay();
    initiateRazorPay();
    super.onInit();
  }

  loadImage() async {
    ByteData bytes = await rootBundle.load(AppImages.applogo);
    var buffer = bytes.buffer;
    image = base64.encode(Uint8List.view(buffer));
  }

  initiateRazorPay() {
    // To handle different event with previous functions
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) async {
    var trans = {
      'payment_id': response.paymentId,
      'order_id': response.orderId,
      'payment_status': '1',
    };
    try {
      serverResponse.addAll(trans);
      const CircularProgressIndicator();
      await TransactionDetails().createTransaction(serverResponse);
    } finally {
      // Navigator.pop(Get.context!);
      EasyLoading.showSuccess('Payment Sucessful ${response.data!}',
          dismissOnTap: true);
    }
  }

  void handlePaymentError(PaymentFailureResponse response) async {
    var trans = {
      'order_id': orderIdValue,
      'payment_status': '0',
    };
    try {
      serverResponse.addAll(trans);
      const CircularProgressIndicator();
      await TransactionDetails().createTransaction(serverResponse);
    } finally {
      EasyLoading.showError('Payment failed ${response.message!}',
          dismissOnTap: true);
    }
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    log(response.toString());
    EasyLoading.showInfo('external wallet ${response.walletName!}');
  }

  @override
  void onClose() {
    razorpay.clear();
    super.onClose();
  }

  Future<void> initiatePayment(dontaionName, int amount, paymentDetails) async {
    serverResponse = paymentDetails;
    String apiUrl = 'https://api.razorpay.com/v1/orders';
    // Make the API request to create an order
    var paymentData = {
      "amount": amount * 100,
      "currency": "INR",
      "receipt": "rcptid 1",
      "partial_payment": false,
    };

    http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Basic ${base64Encode(utf8.encode('$apiKey:$apiSecret'))}',
      },
      body: jsonEncode(paymentData),
    );

    if (response.statusCode == 200) {
      // Parse the response to get the order ID
      var responseData = jsonDecode(response.body);
      orderIdValue = responseData['id'];
      Map<String, dynamic> options = {
        'key': apiKey,
        'amount': amount * 100,
        'name': dontaionName,
        'partial_payment': false,
        'image': image,
        'currency': 'INR',
        'prefill': {
          'name': '${userController.user.value.userName}',
          'contact': '+91${userController.user.value.mobileNumber}',
          'email': 'test@razorpay.com',
          'method': 'upi',
        },
        'order_id': orderIdValue,
      };
      // Open the Razorpay payment form
      razorpay.open(options);
    } else {
      // Handle error response
      debugPrint('Error creating order: ${response.body}');
    }
  }
}
