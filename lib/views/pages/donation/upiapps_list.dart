import 'package:srbs/Controllers/donation/donation_contrller.dart';
import 'package:srbs/constants/import_packages.dart';

class ListOfUPIApps extends StatelessWidget {
  final DonationController donationController;
  final Size size;
  const ListOfUPIApps(
      {super.key, required this.size, required this.donationController});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height * 0.3,
        width: size.width,
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: GridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          // childAspectRatio: 1.6,
          physics: const ClampingScrollPhysics(),
          children: donationController.appMetaList != null
              ? donationController.appMetaList!
                  .map(
                    (it) => InkWell(
                      onTap: () {
                        donationController.upiTransaction(it);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          it.iconImage(48),
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            alignment: Alignment.center,
                            child: Text(
                              it.upiApplication.getAppName(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList()
              : [
                  const Center(
                    child: Text(
                      'No upi app found',
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
        ));
  }
}
