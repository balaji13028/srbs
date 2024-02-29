import 'package:srbs/constants/import_packages.dart';
import 'package:upi_payment_qrcode_generator/upi_payment_qrcode_generator.dart';

class Paymentscreen extends StatefulWidget {
  const Paymentscreen({super.key});

  @override
  State<Paymentscreen> createState() => _PaymentscreenState();
}

class _PaymentscreenState extends State<Paymentscreen> {
//   //TODO Change UPI ID
  final upiDetails = UPIDetails(
      upiID: "9167877725@axl",
      payeeName: "Agnel Selvan",
      amount: 1,
      transactionNote: "Hello World");
  final upiDetailsWithoutAmount = UPIDetails(
    upiID: "9167877725@axl",
    payeeName: "Agnel Selvan",
    transactionNote: "Hello World",
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('UPI Payment QRCode Generator'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("UPI Payment QRCode without Amount",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              UPIPaymentQRCode(
                upiDetails: upiDetailsWithoutAmount,
                size: 220,
                // embeddedImagePath: 'assets/images/logo.png',
                embeddedImageSize: const Size(60, 60),
                // eyeStyle: const QrEyeStyle(
                //   eyeShape: QrEyeShape.circle,
                //   color: Colors.black,
                // ),
                // dataModuleStyle: const QrDataModuleStyle(
                //   dataModuleShape: QrDataModuleShape.circle,
                //   color: Colors.black,
                // ),
              ),
              Text(
                "Scan QR to Pay",
                style: TextStyle(color: Colors.grey[600], letterSpacing: 1.2),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("UPI Payment QRCode with Amount",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              UPIPaymentQRCode(
                upiDetails: upiDetails,
                size: 220,
                upiQRErrorCorrectLevel: UPIQRErrorCorrectLevel.low,
              ),
              Text(
                "Scan QR to Pay",
                style: TextStyle(color: Colors.grey[600], letterSpacing: 1.2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//   @override
//   void initState() {
//     getUPIapps;
//     super.initState();
//   }

//   getUPIapps() async {
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Payment'),
//         centerTitle: false,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         child: Column(
//           children: [
//             TextFieldWidget(
//               text: 'Upi Id',
//               borderColor: ColorPalette.geryColor,
//               lableColor: ColorPalette.labelTextColorgrey,
//               contentPadding:
//                   const EdgeInsets.only(left: 10, bottom: 10, top: 10),
//             ),
//             const SizedBox(height: 20),
//             TextFieldWidget(
//               text: 'Amount',
//               borderColor: ColorPalette.geryColor,
//               lableColor: ColorPalette.labelTextColorgrey,
//               contentPadding:
//                   const EdgeInsets.only(left: 10, bottom: 5, top: 5),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
