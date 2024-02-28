import '../../../constants/import_packages.dart';

class ProfileCard extends StatelessWidget {
  final Size size;
  const ProfileCard({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      width: size.width,
      padding: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: ColorPalette.backGroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: AppDefaults.defaultBoxShadow,
      ),
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                gradient: ColorPalette.secondaryGrdient,
                borderRadius: BorderRadius.circular(8)),
            child: Container(
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.only(left: 5, right: 10),
                leading: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(AppImages.maleImage))),
                title: Text(
                  userController.user.value.userName.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorPalette.primaryColor,
                  ),
                ),
                subtitle: Text(
                  userController.user.value.mobileNumber.toString(),
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: ColorPalette.primaryColor,
                  ),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * 0.1,
                      height: size.height * 0.04,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorPalette.secondaryColor, width: 0.5),
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        '!',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: ColorPalette.secondaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'profile\nIncomplete',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 6,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: const [
                Text(
                  'Profile Status:',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  'Completed 70%',
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: ColorPalette.darkGreenColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
