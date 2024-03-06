import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skeletons/skeletons.dart';
import 'package:srbs/Controllers/transactions/transactions_controller.dart';
import 'package:srbs/Models/transaction%20models/transaction_data.dart';

import '../../../constants/import_packages.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.put(TransactionsController(), permanent: true);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: Obx(
        () => controller.isloading.value
            ? SkeletonListView()
            : controller.transactions.isEmpty
                ? const Center(
                    child: Text('No Transactions'),
                  )
                : ListView.separated(
                    itemCount: controller.transactions.length,
                    separatorBuilder: (context, index) => Container(
                          color: Colors.white,
                          child: const FractionallySizedBox(
                            alignment: Alignment.centerRight,
                            widthFactor: 0.83,
                            child: Padding(
                              padding: EdgeInsets.only(right: 25),
                              child: Divider(),
                            ),
                          ),
                        ),
                    itemBuilder: ((context, index) {
                      TransactionData transaction =
                          controller.transactions[index];

                      return Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            AppImages.upiIcon,
                            width: size.height * 0.04,
                          ),
                          title: Text(
                            transaction.donationType!.title == 'Others'
                                ? transaction.donationName.toString()
                                : transaction.donationType!.title.toString(),
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
                                transaction.donationType!.title == 'Others'
                                    ? transaction.amount.toString()
                                    : transaction.donationType!.amount
                                        .toString(),
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
                              const Icon(
                                Icons.arrow_outward,
                                size: 25,
                              )
                            ],
                          ),
                        ),
                      );
                    })),
      ),
    );
  }
}
