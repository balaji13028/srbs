import 'dart:math';

import 'package:get/get.dart';
import 'package:ns_upi/ns_upi.dart';
import 'package:srbs/Models/transaction%20models/donation_type.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/services/api_calls/transaction_details.dart';
import 'package:srbs/views/pages/donation/upiapps_list.dart';

class DonationController extends GetxController {
  var isloading = false.obs;
  String? id;
  String? value;
  String donationType = '';

  TextEditingController name = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController forname = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController gothram = TextEditingController();

  final formKey = GlobalKey<FormState>();

  List<ApplicationMeta>? appMetaList;

  /// Get list of upi apps availble in our mobile.
  getListofUpiApps(Size size, DonationController donationController) async {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: SizedBox(
          height: 40,
          width: 40,
          child: CircularProgressIndicator(),
        ),
      ),
    );
    appMetaList = await NsUpi.getInstalledUpiApps(
      statusType: UpiApplicationDiscoveryAppStatusType.all,
    );
    Get.bottomSheet(
            ListOfUPIApps(size: size, donationController: donationController))
        .then((value) => Get.back());
  }

  /// UPdate the details, select the donationType.
  updateDeatils(int index, List<DonationType> donationDetails) {
    id = donationDetails[index].id;
    donationType = donationDetails[index].title.toString();
    name.text = donationDetails[index].title == 'Others'
        ? ''
        : donationDetails[index].title.toString();

    amount.text = donationDetails[index].title == 'Others'
        ? ''
        : donationDetails[index].amount.toString();
    desc.text = donationDetails[index].description.toString();
    formKey.currentState!.reset();
  }

  /// Start upi payment.
  Future<void> upiTransaction(ApplicationMeta appMeta) async {
    // print('SRBS${Random().nextInt(10000000)}');
    final UpiTransactionResponse response = await NsUpi.initiateTransaction(
      amount: amount.text,
      app: appMeta.upiApplication,
      receiverName: 'SREE RAMA BHAKTA SAMAJAM 1937',
      receiverUpiAddress: 'sreer994868@barodampay',
      transactionRef: 'SRBS${Random().nextInt(10000000)}',
      transactionNote: name.text,
    );
    // print(response.toString());

    if (response.status.toString() == 'UpiTransactionStatus.success') {
      showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (context) => const Center(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(),
                ),
              )).then((value) => Get.back());
      var paymentDetails = {
        "donationName": name.text,
        "userId": userController.user.value.userId,
        "amount": amount.text,
        "description": desc.text,
        "for": forname.text.isEmpty ? '' : forname.text,
        "gothram": gothram.text.isEmpty ? '' : gothram.text,
        'payment_id': response.txnId,
        'order_id': response.approvalRefNo,
        'payment_status': '1',
      };
      await TransactionDetails().createTransaction(paymentDetails);
      Get.back();
      Get.back();
      EasyLoading.showSuccess('Payment Sucessful ${response.rawResponse}',
          dismissOnTap: true);
    } else {
      // showDialog(
      //   context: Get.context!,
      //   builder: (BuildContext context) {
      //     return ErrorPyment(message: response.status.toString());
      //   },
      // ).then((value) => Get.back());
    }
  }
}
