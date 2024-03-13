import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/views/pages/profile/edit_profile_fields.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: size.width,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      userController.user.value.gender == 'Male'
                          ? AppImages.maleImage
                          : AppImages.femaleImage,
                      height: size.height * 0.12,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userController.user.value.userName.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorPalette.primaryColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  '+91-${userController.user.value.mobileNumber}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: ColorPalette.primaryColor,
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            basicDetailsFieldscard(
              iconName: CupertinoIcons.person,
              typeName: 'First Name',
              value: userController.user.value.firstName,
            ),
            basicDetailsFieldscard(
              iconName: CupertinoIcons.person,
              typeName: 'Last Name',
              value: userController.user.value.lastName,
            ),
            basicDetailsFieldscard(
              iconName: MdiIcons.genderTransgender,
              typeName: 'Gender',
              value: userController.user.value.gender,
            ),
            basicDetailsFieldscard(
              typeName: 'Gothram',
              value: userController.user.value.gothram,
            ),
            basicDetailsFieldscard(
              iconName: CupertinoIcons.location_solid,
              typeName: 'Address',
              value: userController.user.value.address,
            ),
          ]),
        ),
      ),
    );
  }

  Container basicDetailsFieldscard(
      {IconData? iconName, required String typeName, value}) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: AppDefaults.defaultBoxShadow,
      ),
      child: ListTile(
        dense: false,
        horizontalTitleGap: 10,
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ColorPalette.primaryColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(8),
          ),
          child: iconName != null
              ? Icon(
                  iconName,
                  color: Colors.white,
                  size: 24,
                )
              : Image.asset(
                  AppImages.gothramIcon,
                  width: 26,
                ),
        ),
        title: Text(
          typeName,
          style: TextStyle(
            fontSize: 12,
            color: ColorPalette.labelTextColorgrey,
          ),
        ),
        subtitle: Text(
          value ?? '--------',
          style: const TextStyle(
            fontSize: 18,
            color: ColorPalette.greyColor,
          ),
        ),
        trailing: typeName != 'Gender'
            ? IconButton(
                alignment: Alignment.center,
                onPressed: () {
                  Get.to(() => EditPrfileFields(
                          typeName: typeName, value: value ?? ''))!
                      .then(
                    (value) => setState(() {
                      userController.user.value;
                    }),
                  );
                },
                icon: const Icon(
                  Icons.edit,
                  size: 18,
                ))
            : null,
      ),
    );
  }
}
