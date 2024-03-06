import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:srbs/Models/transaction%20models/donation_type.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/services/provider/razorpay_integration.dart';
import 'package:srbs/utils/buttons.dart';
import 'package:srbs/utils/ui_halper.dart';
import 'package:srbs/views/widgets/text%20fields/dropdown_form_widget.dart';

class DonationCard extends StatefulWidget {
  final List<DonationType> donationDetails;
  final Size size;
  const DonationCard(
      {super.key, required this.size, required this.donationDetails});

  @override
  State<DonationCard> createState() => _DonationCardState();
}

class _DonationCardState extends State<DonationCard> {
  final controller = Get.put(RazorpayIntegration());
  String? id;
  String? value;
  int index = -1;
  String donationType = '';
  TextEditingController name = TextEditingController();

  TextEditingController amount = TextEditingController();

  TextEditingController forname = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController gothram = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppUiHelper.dismissKeyboard(context: context),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: widget.size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Form(
                      key: formKey,
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
                          DropDownFormFieldWidget(
                              contentPadding: const EdgeInsets.only(
                                  left: 10, bottom: 15, top: 5),
                              borderColor: ColorPalette.greyColor,
                              lableColor: ColorPalette.labelTextColorgrey,
                              text: 'Donation Type',
                              listItems: List.generate(
                                widget.donationDetails.length,
                                (i) => DropdownMenuItem(
                                  onTap: () {
                                    setState(() {
                                      index = i;
                                      formKey.currentState!.reset();
                                    });
                                  },
                                  value: widget.donationDetails[i].title,
                                  child: Text(widget.donationDetails[i].title
                                      .toString()),
                                ),
                              ),
                              initialValue: value,
                              onChanged: (value) {
                                setState(() {
                                  value = value;
                                  id = widget.donationDetails[index].id;
                                  donationType = widget
                                      .donationDetails[index].title
                                      .toString();
                                  name.text =
                                      widget.donationDetails[index].title ==
                                              'Others'
                                          ? ''
                                          : widget.donationDetails[index].title
                                              .toString();

                                  amount.text =
                                      widget.donationDetails[index].title ==
                                              'Others'
                                          ? ''
                                          : widget.donationDetails[index].amount
                                              .toString();
                                  desc.text = widget
                                      .donationDetails[index].description
                                      .toString();
                                });
                              }),
                          Visibility(
                            visible: donationType == 'Others' ? true : false,
                            child: TextFieldWidget(
                              controller: name,
                              text: 'Donation Name',
                              borderColor: ColorPalette.greyColor,
                              lableColor: ColorPalette.labelTextColorgrey,
                              contentPadding: const EdgeInsets.only(
                                  left: 10, bottom: 5, top: 5),
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
                            controller: amount,
                            text: 'Amount',
                            readyOnly: donationType == 'Others' ? false : true,
                            borderColor: ColorPalette.greyColor,
                            lableColor: ColorPalette.labelTextColorgrey,
                            contentPadding: const EdgeInsets.only(
                                left: 10, bottom: 5, top: 5),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return '*This field is mandatory';
                              }
                              return null;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onchanged: (value) {
                              setState(() {
                                amount.text = value!;
                              });
                            },
                          ),
                          const SizedBox(height: 8),
                          TextFieldWidget(
                            controller: forname,
                            text: 'For',
                            borderColor: ColorPalette.greyColor,
                            lableColor: ColorPalette.labelTextColorgrey,
                            contentPadding: const EdgeInsets.only(
                                left: 10, bottom: 5, top: 5),
                          ),
                          const SizedBox(height: 8),
                          TextFieldWidget(
                            controller: gothram,
                            text: 'Gothram',
                            borderColor: ColorPalette.greyColor,
                            lableColor: ColorPalette.labelTextColorgrey,
                            contentPadding: const EdgeInsets.only(
                                left: 10, bottom: 5, top: 5),
                          ),
                          SizedBox(height: widget.size.height * 0.05),
                          Container(
                              height: widget.size.width * 0.16,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ColorPalette.labelTextColorgrey
                                    .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: ListTile(
                                contentPadding:
                                    const EdgeInsets.only(left: 10, right: 5),
                                dense: true,
                                title: const Text('Total'),
                                subtitle: Expanded(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          amount.text.isNotEmpty
                                              ? amount.text
                                              : '00',
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 16,
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
                                ),
                                trailing: Buttons().secondaryGradientButton(
                                  width: widget.size.width * 0.4,
                                  height: widget.size.width * 0.1,
                                  text: 'Proceed to pay',
                                  borderRadius: 4,
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      var options = {
                                        "donationName": name.text,
                                        "userId":
                                            userController.user.value.userId,
                                        "amount": amount.text,
                                        "description": desc.text,
                                        "for": forname.text.isEmpty
                                            ? ''
                                            : forname.text,
                                        "gothram": gothram.text.isEmpty
                                            ? ''
                                            : gothram.text,
                                      };
                                      const CircularProgressIndicator();
                                      controller.initiatePayment(
                                        name.text,
                                        int.parse(amount.text.toString()),
                                        options,
                                      );
                                      Get.back();
                                    }
                                  },
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      right: widget.size.width * 0.03,
                      width: widget.size.width * 0.2,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.grey.shade500,
                          size: 35,
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
