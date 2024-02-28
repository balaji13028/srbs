import '../../../constants/import_packages.dart';

class GenderSection extends StatelessWidget {
  final Size size;
  final RegistrationController registrationController;
  const GenderSection({
    super.key,
    required this.size,
    required this.registrationController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              registrationController.gender.value = 'Male';
            },
            child: Obx(() => Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: registrationController.gender.value ==
                            registrationController.male
                        ? ColorPalette.primaryColor
                        : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      AppImages.maleImage,
                      height: size.height * 0.1,
                    ),
                  ),
                )),
          ),
          GestureDetector(
            onTap: () {
              registrationController.gender.value = 'Female';
            },
            child: Obx(() => Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: registrationController.gender.value ==
                            registrationController.female
                        ? ColorPalette.primaryColor
                        : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      AppImages.femaleImage,
                      height: size.height * 0.1,
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
