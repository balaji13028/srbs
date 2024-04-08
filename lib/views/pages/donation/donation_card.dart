import 'package:get/get.dart';
import 'package:srbs/Models/transaction%20models/donation_type.dart';
import 'package:srbs/constants/import_packages.dart';
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
  final donationController = Get.put(DonationController());

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
                      key: donationController.formKey,
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
                                      donationController.updateDeatils(
                                        i,
                                        widget.donationDetails,
                                      );
                                    });
                                  },
                                  value: widget.donationDetails[i].title,
                                  child: Text(widget.donationDetails[i].title
                                      .toString()),
                                ),
                              ),
                              initialValue: donationController.value,
                              onChanged: (value) {
                                setState(() {
                                  value = value;
                                });
                              }),
                          Visibility(
                            visible: donationController.donationType == 'Others'
                                ? true
                                : false,
                            child: TextFieldWidget(
                              controller: donationController.name,
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
                            controller: donationController.amount,
                            text: 'Amount',
                            readyOnly:
                                donationController.donationType == 'Others'
                                    ? false
                                    : true,
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
                            contentPadding: const EdgeInsets.only(
                                left: 10, bottom: 5, top: 5),
                          ),
                          const SizedBox(height: 8),
                          TextFieldWidget(
                            controller: donationController.gothram,
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
                                subtitle: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        donationController
                                                .amount.text.isNotEmpty
                                            ? donationController.amount.text
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
                                trailing: Buttons().secondaryGradientButton(
                                  width: widget.size.width * 0.4,
                                  height: widget.size.width * 0.1,
                                  text: 'Proceed to pay',
                                  borderRadius: 4,
                                  onTap: () async {
                                    donationController.getListofUpiApps(
                                      widget.size,
                                      donationController,
                                    );
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
