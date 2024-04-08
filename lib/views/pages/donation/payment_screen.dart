import 'package:get/get.dart';
import 'package:srbs/Models/transaction%20models/donation_type.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/utils/buttons.dart';
import 'package:srbs/views/widgets/text%20fields/dropdown_form_widget.dart';

class Donationscreen extends StatefulWidget {
  final List<DonationType> donationDetails;

  const Donationscreen({super.key, required this.donationDetails});

  @override
  State<Donationscreen> createState() => _DonationscreenState();
}

class _DonationscreenState extends State<Donationscreen> {
  final donationController = Get.put(DonationController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Donation',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: donationController.formKey,
          child: Column(
            children: [
              DropDownFormFieldWidget(
                  contentPadding:
                      const EdgeInsets.only(left: 10, bottom: 15, top: 5),
                  borderColor: ColorPalette.greyColor,
                  lableColor: ColorPalette.labelTextColorgrey,
                  text: 'Donation Type / విరాళం రకం',
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
                  text: 'Donation Name / విరాళం పేరు',
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
                text: 'Donation Amount / విరాళం మొత్తం',
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
                text: 'For / పేరు',
                borderColor: ColorPalette.greyColor,
                lableColor: ColorPalette.labelTextColorgrey,
                contentPadding:
                    const EdgeInsets.only(left: 10, bottom: 5, top: 5),
              ),
              const SizedBox(height: 8),
              TextFieldWidget(
                controller: donationController.gothram,
                text: 'Gothram / గోత్రం',
                borderColor: ColorPalette.greyColor,
                lableColor: ColorPalette.labelTextColorgrey,
                contentPadding:
                    const EdgeInsets.only(left: 10, bottom: 5, top: 5),
              ),
              Container(
                height: size.width * 0.18,
                margin: const EdgeInsets.only(top: 60),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorPalette.labelTextColorgrey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
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
                      donationController.getListofUpiApps(
                          size, donationController);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
