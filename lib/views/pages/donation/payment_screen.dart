import 'package:get/get.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/services/provider/razorpay_integration.dart';
import 'package:srbs/utils/buttons.dart';

class Paymentscreen extends StatefulWidget {
  const Paymentscreen({super.key});

  @override
  State<Paymentscreen> createState() => _PaymentscreenState();
}

class _PaymentscreenState extends State<Paymentscreen> {
  TextEditingController upi = TextEditingController();
  TextEditingController amount = TextEditingController();
  final controller = Get.put(RazorpayIntegration());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextFieldWidget(
              text: 'Upi Id',
              controller: upi,
              borderColor: ColorPalette.greyColor,
              lableColor: ColorPalette.labelTextColorgrey,
              contentPadding:
                  const EdgeInsets.only(left: 10, bottom: 10, top: 10),
            ),
            const SizedBox(height: 20),
            TextFieldWidget(
              controller: amount,
              text: 'Amount',
              borderColor: ColorPalette.greyColor,
              lableColor: ColorPalette.labelTextColorgrey,
              contentPadding:
                  const EdgeInsets.only(left: 10, bottom: 5, top: 5),
            ),
            const SizedBox(height: 30),
            Buttons().secondaryButton(
              width: 50,
              height: 48,
              text: 'pay',
              onTap: () {
                if (amount.text.isNotEmpty) {
                  // controller.openCheckOut(int.parse(amount.text.toString()));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailRow(String key, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Row(
        children: [
          Text('$key:', style: const TextStyle(fontWeight: FontWeight.w800)),
          const SizedBox(width: 8.0),
          Flexible(
            child: Text(
              value,
              overflow: TextOverflow.visible,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  void showRoundedDialog(BuildContext context, String? message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Error',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                Text('$message'),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
