import 'package:skeletons/skeletons.dart';
import 'package:srbs/Controllers/home%20Controllers/home_controller.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/views/pages/transactions/transaction_card.dart';
import 'package:srbs/views/pages/transactions/transactions_page.dart';

class RecentTransactions extends StatelessWidget {
  final Size size;
  final HomeController controller;
  const RecentTransactions(
      {super.key, required this.controller, required this.size});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? Flexible(
              child: Container(
                clipBehavior: Clip.hardEdge,
                width: size.width,
                padding: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: ColorPalette.backGroundColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: AppDefaults.defaultBoxShadow,
                ),
                child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: AppDefaults.defaultBoxShadow,
                    ),
                    child: SkeletonListView(itemCount: 5)),
              ),
            )
          : Container(
              clipBehavior: Clip.hardEdge,
              width: size.width,
              padding: const EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: ColorPalette.backGroundColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: AppDefaults.defaultBoxShadow,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Recent Transactions',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ColorPalette.primaryColor,
                          ),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        const TransactionsPage())));
                          },
                          child: const Text(
                            'View All',
                            style: TextStyle(
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Transactions display.
                  Container(
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      children: [
                        ...controller.recentTransactions.map(
                          (transaction) => TransactionCard(
                            size: size,
                            transaction: transaction,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
