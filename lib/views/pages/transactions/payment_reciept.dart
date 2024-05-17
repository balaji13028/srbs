import 'package:srbs/Models/transaction%20models/transaction_data.dart';
import 'package:srbs/constants/import_packages.dart';

import '../../../utils/ui_halper.dart';

class PaymentReciept extends StatelessWidget {
  final Size size;
  final TransactionData paymnetDetails;
  const PaymentReciept(
      {super.key, required this.size, required this.paymnetDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppUiHelper.dismissKeyboard(context: context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: const Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
