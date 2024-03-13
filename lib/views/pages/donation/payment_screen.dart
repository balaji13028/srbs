import 'package:get/get.dart';
import 'package:srbs/Controllers/donation/donation_contrller.dart';
import 'package:srbs/Models/transaction%20models/donation_type.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/utils/buttons.dart';
import 'package:srbs/views/widgets/text%20fields/dropdown_form_widget.dart';

class Paymentscreen extends StatefulWidget {
  final List<DonationType> donationDetails;

  const Paymentscreen({super.key, required this.donationDetails});

  @override
  State<Paymentscreen> createState() => _PaymentscreenState();
}

class _PaymentscreenState extends State<Paymentscreen> {
  final donationController = Get.put(DonationController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        title: const Text(
          'Donation',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Form(
          key: donationController.formKey,
          child: Column(
            children: [
              const SizedBox(height: 10),
              DropDownFormFieldWidget(
                  contentPadding:
                      const EdgeInsets.only(left: 10, bottom: 15, top: 5),
                  borderColor: ColorPalette.greyColor,
                  lableColor: ColorPalette.labelTextColorgrey,
                  text: 'Donation Type',
                  listItems: List.generate(
                    widget.donationDetails.length,
                    (i) => DropdownMenuItem(
                      onTap: () {
                        setState(() {
                          donationController.updateDeatils(
                            i,
                            widget.donationDetails,
                          );
                        });
                      },
                      value: widget.donationDetails[i].title,
                      child: Text(widget.donationDetails[i].title.toString()),
                    ),
                  ),
                  initialValue: donationController.value,
                  onChanged: (value) {
                    setState(() {
                      value = value;
                    });
                  }),
              Visibility(
                visible:
                    donationController.donationType == 'Others' ? true : false,
                child: TextFieldWidget(
                  controller: donationController.name,
                  text: 'Donation Name',
                  borderColor: ColorPalette.greyColor,
                  lableColor: ColorPalette.labelTextColorgrey,
                  contentPadding:
                      const EdgeInsets.only(left: 10, bottom: 5, top: 5),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '*This field is mandatory';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 8),
              TextFieldWidget(
                controller: donationController.amount,
                text: 'Amount',
                readyOnly:
                    donationController.donationType == 'Others' ? false : true,
                borderColor: ColorPalette.greyColor,
                lableColor: ColorPalette.labelTextColorgrey,
                contentPadding:
                    const EdgeInsets.only(left: 10, bottom: 5, top: 5),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return '*This field is mandatory';
                  }
                  return null;
                },
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onchanged: (value) {
                  setState(() {
                    donationController.amount.text = value!;
                  });
                },
              ),
              const SizedBox(height: 8),
              TextFieldWidget(
                controller: donationController.forname,
                text: 'For',
                borderColor: ColorPalette.greyColor,
                lableColor: ColorPalette.labelTextColorgrey,
                contentPadding:
                    const EdgeInsets.only(left: 10, bottom: 5, top: 5),
              ),
              const SizedBox(height: 8),
              TextFieldWidget(
                controller: donationController.gothram,
                text: 'Gothram',
                borderColor: ColorPalette.greyColor,
                lableColor: ColorPalette.labelTextColorgrey,
                contentPadding:
                    const EdgeInsets.only(left: 10, bottom: 5, top: 5),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
        color: Colors.white54,
        child: ListTile(
          contentPadding: const EdgeInsets.only(left: 10, right: 5),
          dense: true,
          title: const Text('Total'),
          subtitle: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: Text(
                  donationController.amount.text.isNotEmpty
                      ? donationController.amount.text
                      : '00',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1,
                    fontWeight: FontWeight.bold,
                    color: ColorPalette.primaryColor,
                  ),
                ),
              ),
              const Text(
                '.00 INR',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10,
                  height: 1.5,
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
            onTap: () async {
              donationController.payUsingUPi();
            },
          ),
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
