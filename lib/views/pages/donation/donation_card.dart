import 'package:get/get.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/utils/buttons.dart';
import 'package:srbs/views/pages/donation/payment_screen.dart';

class DonationCard extends StatelessWidget {
  final Size size;
  const DonationCard({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                'Donation',
                style: TextStyle(
                    fontSize: 20,
                    color: ColorPalette.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                text: 'Donation Name',
                borderColor: ColorPalette.geryColor,
                lableColor: ColorPalette.labelTextColorgrey,
                contentPadding:
                    const EdgeInsets.only(left: 10, bottom: 5, top: 5),
              ),
              const SizedBox(height: 8),
              TextFieldWidget(
                text: 'Amount',
                borderColor: ColorPalette.geryColor,
                lableColor: ColorPalette.labelTextColorgrey,
                contentPadding:
                    const EdgeInsets.only(left: 10, bottom: 5, top: 5),
              ),
              const SizedBox(height: 8),
              TextFieldWidget(
                text: 'For',
                borderColor: ColorPalette.geryColor,
                lableColor: ColorPalette.labelTextColorgrey,
                contentPadding:
                    const EdgeInsets.only(left: 10, bottom: 5, top: 5),
              ),
              const SizedBox(height: 8),
              TextFieldWidget(
                text: 'Gothram',
                borderColor: ColorPalette.geryColor,
                lableColor: ColorPalette.labelTextColorgrey,
                contentPadding:
                    const EdgeInsets.only(left: 10, bottom: 5, top: 5),
              ),
              SizedBox(height: size.height * 0.05),
              Container(
                  height: size.width * 0.16,
                  decoration: BoxDecoration(
                    color: ColorPalette.labelTextColorgrey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.only(left: 10, right: 5),
                    dense: true,
                    title: const Text('Total'),
                    subtitle: Row(
                      children: const [
                        Text(
                          '1000',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ColorPalette.primaryColor,
                          ),
                        ),
                        Text(
                          '.00 INR',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: ColorPalette.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    trailing: Buttons().secondaryGradientButton(
                      width: size.width * 0.4,
                      height: size.width * 0.1,
                      text: 'Proceed to pay',
                      borderRadius: 4,
                      onTap: () {
                        Get.to(() => const Paymentscreen());
                      },
                    ),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
