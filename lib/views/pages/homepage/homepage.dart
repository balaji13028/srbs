import 'package:get/get.dart';
import 'package:srbs/Controllers/home%20Controllers/home_controller.dart';
import 'package:srbs/constants/import_packages.dart';
import 'package:srbs/views/pages/homepage/donation_button.dart';
import 'package:srbs/views/pages/homepage/recent_transactions.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: RefreshIndicator(
        onRefresh: () async {
          await homeController.fetchHomescreendata();
        },
        child: PopScope(
          canPop: false,
          child: Container(
            height: size.height,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.backGroundImage),
                fit: BoxFit.cover,
              ),
            ),
            child: ListTileTheme.merge(
              dense: true,
              child: ListView(
                shrinkWrap: true,
                children: [
                  const SizedBox(height: 5),
                  ProfileCard(size: size),
                  const SizedBox(height: 20),
                  UpcomingEvents(controller: homeController),
                  const SizedBox(height: 20),
                  DonationButton(homeController: homeController, size: size),
                  const SizedBox(height: 20),
                  RecentTransactions(controller: homeController, size: size),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
