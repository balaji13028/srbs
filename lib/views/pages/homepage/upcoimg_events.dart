import '../../../constants/import_packages.dart';

class UpcoimgEvents extends StatelessWidget {
  final Size size;
  const UpcoimgEvents({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.none,
        width: size.width,
        padding: const EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: ColorPalette.backGroundColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: AppDefaults.defaultBoxShadow,
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Upcoming Events',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: ColorPalette.primaryColor,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 10,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                    color: ColorPalette.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            clipBehavior: Clip.hardEdge,
            height: size.height * 0.45,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: ColorPalette.lightprimaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 10),
                      elevation: 4,
                      child: Container(
                          height: size.width * 0.26,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  height: size.height,
                                  alignment: Alignment.center,
                                  width: size.width * 0.2,
                                  decoration: BoxDecoration(
                                    gradient: ColorPalette.primaryGradient,
                                    // borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                // EventInvitationCard(
                                //   size: size,
                                //   event: event,
                                //   parseDate: parseDate,
                                // ),
                                SizedBox(width: size.width * 0.03),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Flexible(
                                        child: Text(
                                          'Event Name',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: ColorPalette.primaryColor),
                                        ),
                                      ),
                                      const Flexible(
                                        child: Text(
                                          'Event category',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Icon(
                                            Icons.calendar_month,
                                            size: 14,
                                            color: ColorPalette.primaryColor,
                                          ),
                                          Text(
                                            'Event date',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 11,
                                                color:
                                                    ColorPalette.primaryColor,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Icon(
                                            Icons.timer,
                                            size: 14,
                                            color: ColorPalette.primaryColor,
                                          ),
                                          Text(
                                            'Event Time',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 11,
                                                color:
                                                    ColorPalette.primaryColor,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                              ])));
                }),
          )
        ]));
  }
}
