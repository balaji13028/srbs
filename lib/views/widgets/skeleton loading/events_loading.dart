import 'package:skeletons/skeletons.dart';
import 'package:srbs/constants/import_packages.dart';

class EventLoading extends StatelessWidget {
  final Size size;
  const EventLoading({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
              width: size.width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                        width: double.infinity, height: size.width * 0.4),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.white,
                      alignment: Alignment.center,
                      height: size.height * 0.08,
                      width: size.width,
                      child: SkeletonListTile(
                        hasLeading: false,
                        hasSubtitle: true,
                        titleStyle:
                            SkeletonLineStyle(height: size.height * 0.02),
                      ),
                    ),
                  ),
                ],
              ));
        });
  }
}
