import 'package:skeletons/skeletons.dart';
import 'package:srbs/constants/import_packages.dart';

class UpcoimgEventLoading extends StatelessWidget {
  final Size size;
  const UpcoimgEventLoading({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: ColorPalette.backGroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: AppDefaults.defaultBoxShadow,
      ),
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
                clipBehavior: Clip.hardEdge,
                margin: const EdgeInsets.all(2),
                width: double.infinity,
                height: size.height * 0.28,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Stack(children: [
                  SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      width: double.infinity,
                      height: size.width * 0.4,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: size.height * 0.1,
                      child: SkeletonListTile(
                        hasLeading: false,
                        hasSubtitle: true,
                        trailing: SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            randomHeight: false,
                            randomWidth: false,
                            width: size.width * 0.18,
                            height: size.width * 0.14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}
