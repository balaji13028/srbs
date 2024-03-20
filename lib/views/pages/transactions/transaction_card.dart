import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:srbs/Models/transaction%20models/transaction_data.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/views/pages/transactions/ayment_reciept.dart';

class TransactionCard extends StatelessWidget {
  final Size size;
  final TransactionData transaction;
  const TransactionCard(
      {super.key, required this.size, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        AppImages.upiIcon,
        width: size.height * 0.04,
      ),
      title: Text(
        transaction.donationName.toString(),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        '${DateFormat('dd/MM/yy').format(transaction.timeStamp!)} ${DateFormat.jm().format(transaction.timeStamp!)}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontWeight: FontWeight.w300,
          color: ColorPalette.greyColor,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            transaction.amount.toString(),
            style: const TextStyle(
              fontSize: 18,
              height: 0,
              fontWeight: FontWeight.bold,
              color: ColorPalette.greyColor,
            ),
          ),
          const Text(
            '.00',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: ColorPalette.greyColor,
              height: 1.5,
            ),
          ),
          const SizedBox(width: 3),
          transaction.paymentStatus == '1'
              ? const Icon(
                  Icons.arrow_outward,
                  size: 25,
                  color: ColorPalette.darkGreenColor,
                )
              : const Icon(
                  Icons.info_outline,
                  color: Color.fromARGB(255, 216, 25, 11),
                )
        ],
      ),
      onTap: () {
        Get.dialog(PaymentReciept(
          size: size,
          paymnetDetails: transaction,
        ));
      },
    );
  }
}
