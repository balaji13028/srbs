import 'package:get/get.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/services/provider/shared_preference.dart';
import 'package:srbs/utils/buttons.dart';
import 'package:srbs/utils/ui_halper.dart';

class EditPrfileFields extends StatefulWidget {
  final String typeName;
  final String value;
  const EditPrfileFields(
      {super.key, required this.typeName, required this.value});

  @override
  State<EditPrfileFields> createState() => _EditPrfileFieldsState();
}

class _EditPrfileFieldsState extends State<EditPrfileFields> {
  late TextEditingController typeName;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    typeName = TextEditingController(text: widget.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => AppUiHelper.dismissKeyboard(context: context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.typeName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          ),
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFieldWidget(
                  text: widget.typeName,
                  controller: typeName,
                  lableColor: ColorPalette.labelTextColorgrey,
                  borderColor: ColorPalette.greyColor,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '*This field is mandatory';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                Buttons().primaryButton(
                  width: size.width * 0.4,
                  height: size.width * 0.11,
                  text: 'Submit',
                  fontSize: 18,
                  borderRadius: 4,
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        setState(() {
                          userController.isprofileLoading(true);
                        });
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) => const Center(
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                        String? key =
                            '${widget.typeName[0].toLowerCase()}${widget.typeName.substring(1)}'
                                .replaceAll(' ', '');
                        var response = await UserDetails().updateUserDetails(
                          key,
                          typeName.text,
                        );
                        if (response == 'user udated successfully' ||
                            response == "user updated successfully") {
                          return updateData(key);
                        } else {
                          ScaffoldMessenger.of(Get.context!).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.redAccent,
                              content: Text(
                                'Some thing went wrong, Please try again',
                              ),
                            ),
                          );
                        }
                      } finally {
                        setState(() {
                          userController.isprofileLoading(false);
                        });
                        Get.back();
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context, userController.user.value);
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  updateData(key) async {
    SharedPreferencesService prefs = SharedPreferencesService.to;

    switch (key) {
      case 'firstName':
        userController.user.value.firstName = typeName.text;
        checkStatus();
        await prefs.saveUserData(jsonEncode(userController.user.value));

        break;
      case 'lastName':
        userController.user.value.lastName = typeName.text;
        checkStatus();
        await prefs.saveUserData(jsonEncode(userController.user.value));
        break;

      case 'gothram':
        userController.user.value.gothram = typeName.text;
        checkStatus();
        await prefs.saveUserData(jsonEncode(userController.user.value));
        checkStatus();
        break;
      case 'address':
        userController.user.value.address = typeName.text;
        checkStatus();
        await prefs.saveUserData(jsonEncode(userController.user.value));

        break;
    }
  }
}
