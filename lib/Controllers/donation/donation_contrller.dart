import 'package:easy_upi_payment/easy_upi_payment.dart';
import 'package:get/get.dart';
import 'package:srbs/Models/transaction%20models/donation_type.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/services/provider/razorpay_integration.dart';

class DonationController extends GetxController {
  var isloading = false.obs;
  String? id;
  String? value;
  String donationType = '';
  int index = -1;
  TextEditingController name = TextEditingController();

  TextEditingController amount = TextEditingController();

  TextEditingController forname = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController gothram = TextEditingController();
  final formKey = GlobalKey<FormState>();

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

  usingRazorpayPayment(RazorpayIntegration razorpayController) async {
    if (formKey.currentState!.validate()) {
      var options = {
        "donationName": name.text,
        "userId": userController.user.value.userId,
        "amount": amount.text,
        "description": desc.text,
        "for": forname.text.isEmpty ? '' : forname.text,
        "gothram": gothram.text.isEmpty ? '' : gothram.text,
      };

      try {
        showDialog(
            context: Get.context!,
            barrierDismissible: false,
            builder: (context) => const Center(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(),
                  ),
                ));
        await razorpayController.initiatePayment(
          name.text,
          int.parse(amount.text.toString()),
          options,
        );
      } finally {
        Get.back();
      }
    }
  }

  payUsingUPi() async {
    if (formKey.currentState!.validate()) {
      try {
        final res = await EasyUpiPaymentPlatform.instance.startPayment(
          EasyUpiPaymentModel(
            payeeVpa: 'BHARATPE09913328757@yesbankltd',
            payeeName: 'balaji',
            amount: double.parse(amount.text.toString()),
            description: 'Testing payment',
          ),
        );

        print(res);
      } on EasyUpiPaymentException {
        print(EasyUpiPaymentException);
      }
    }
  }
}
