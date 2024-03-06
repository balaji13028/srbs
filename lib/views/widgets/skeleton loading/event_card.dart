import 'package:skeletons/skeletons.dart';
import 'package:srbs/constants/import_packages.dart';

class EventSkeletonSample extends StatelessWidget {
  final Size size;
  const EventSkeletonSample({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              elevation: 0,
              child: Container(
                height: size.width * 0.32,
                width: size.width,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        padding: const EdgeInsets.only(right: 10),
                        height: size.width * 0.3,
                        width: size.width * 0.24,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SkeletonParagraph(
                              style: SkeletonParagraphStyle(
                                  padding: const EdgeInsets.all(0),
                                  lines: 3,
                                  spacing: 6,
                                  lineStyle: SkeletonLineStyle(
                                    randomLength: true,
                                    height: 10,
                                    borderRadius: BorderRadius.circular(8),
                                    minLength:
                                        MediaQuery.of(context).size.width / 2,
                                  )),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SkeletonAvatar(
                                  style: SkeletonAvatarStyle(
                                    height: size.width * 0.12,
                                    width: size.width * 0.12,
                                  ),
                                ),
                                SkeletonAvatar(
                                  style: SkeletonAvatarStyle(
                                    height: size.width * 0.12,
                                    width: size.width * 0.12,
                                  ),
                                ),
                                SkeletonAvatar(
                                  style: SkeletonAvatarStyle(
                                    height: size.width * 0.12,
                                    width: size.width * 0.12,
                                  ),
                                ),
                                SkeletonAvatar(
                                  style: SkeletonAvatarStyle(
                                    height: size.width * 0.12,
                                    width: size.width * 0.12,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ));
        });
  }
}
