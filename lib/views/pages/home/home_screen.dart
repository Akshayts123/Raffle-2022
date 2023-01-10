import 'dart:async';
import 'package:draggable_home/draggable_home.dart';
import 'package:draw_idea/utils/style.dart';
import 'package:draw_idea/views/pages/home/widgets/add_banner.dart';
import 'package:draw_idea/views/pages/home/widgets/appbanner.dart';
import 'package:draw_idea/views/pages/home/widgets/bottom_nav_bar.dart';
import 'package:draw_idea/views/pages/home/widgets/enjoy_gaming.dart';
import 'package:draw_idea/views/pages/home/widgets/featured_offer.dart';
import 'package:draw_idea/views/pages/home/widgets/help_support.dart';
import 'package:draw_idea/views/pages/home/widgets/image_view.dart';
import 'package:draw_idea/views/pages/home/widgets/job_education.dart';
import 'package:draw_idea/views/pages/home/widgets/latest_movies.dart';
import 'package:draw_idea/views/pages/home/widgets/menu_slider.dart';
import 'package:draw_idea/views/pages/home/widgets/music_slider.dart';
import 'package:draw_idea/views/pages/home/widgets/new_connection.dart';
import 'package:draw_idea/views/pages/home/widgets/news_slider.dart';
import 'package:draw_idea/views/pages/home/widgets/offer_banner.dart';
import 'package:draw_idea/views/pages/home/widgets/progress_circles.dart';
import 'package:country_pickers/country.dart';
import 'package:draw_idea/views/pages/home/widgets/small_banner.dart';
import 'package:draw_idea/views/pages/home/widgets/stacked_banner.dart';
import 'package:draw_idea/views/pages/home/widgets/super_dialog.dart';
import 'package:draw_idea/views/pages/home/widgets/tab_view.dart';
import 'package:draw_idea/views/pages/home/widgets/tickets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../controller/home_controller.dart';
import '../../../controller/register_controller.dart';
import '../../../controller/splash_controller.dart';
import '../../widgets/drawer/drawer.dart';
import 'searchbar.dart';
import 'home_buttons.dart';

class HomeScreen extends StatefulWidget {
  // static String id = 'HomeScreen';
  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final RegisterController loginController = Get.find();
  // final RegisterController loginController = Get.find();
  // SharedPreferences? prefs;

  RxBool guest = true.obs;
  late final user;
  var variable = 0;
  final Duration initialDelay = Duration(milliseconds: 500);
  final HomeController _coffeeController = Get.find();
  final SplashController _splashController = Get.find();
  String page = 'Blue';
  bool folded = true;
  final hiding = true;
  final AdvancedDrawerController _advancedDrawerController =
      AdvancedDrawerController();
  final ScrollController controller = ScrollController();

  int switcherIndex4 = 0;
  int switcherIndex2 = 0;
  Country _selectedDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('91');

  @override
  Widget build(BuildContext context) {

    return  WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AdvancedDrawer(
        backdropColor: Color(0xFF2F3044),
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: true,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        drawer: drawer(),
        child: RefreshIndicator(
          onRefresh: _coffeeController.refreshLocalGallery,
          child: DraggableHome(
            leading: const Icon(Icons.arrow_back_ios),
            title: const Text("Raffle Draw"),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            ],
            headerWidget: headerWidget(context),
            // headerBottomBar: headerBottomBarWidget(),
            body: [
              Obx(
                () => guest.value == true ? listViewguest() : listView(),
              ),
            ],
            headerExpandedHeight: 0.21,
            fullyStretchable: false,
            bottomNavigationBar: Bottom_nav(),
            // floatingActionButton: FloatingAction(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            // expandedBody: const CameraPreview(),
            backgroundColor: Color(0xFFFFF9E9),
            appBarColor: Style.systemblue,
          ),
        ),
      ),
    );
  }

  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Theme(
          data:
              Theme.of(context).copyWith(dialogBackgroundColor: Colors.black87),
          child: Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: SuperDialog(),
          )),
    );
  }

  Widget headerWidget(BuildContext context) {
    return Container(
      height: 80,
      color: Style.systemblue,
      child: Container(
        padding: EdgeInsets.only(left: 0),
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: folded ? true : false,
              leadingWidth: 70,
              elevation: 0,
              backgroundColor: Style.systemblue,
              leading: folded
                  ? Container(
                      margin: EdgeInsets.only(top: 5),
                      height: 30,
                      // width: 75,
                      child: ListTile(
                        onTap: _openCountryPickerDialog,
                        title: _buildDialog(_selectedDialogCountry),
                      ),
                    )
                  : null,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: DemoPage(),
                  ),
                ],
              ),
              actions: [
                Container(
                  padding: EdgeInsets.only(top: 5),
                  child: IconButton(
                    onPressed: _handleMenuButtonPressed,
                    icon: ValueListenableBuilder<AdvancedDrawerValue>(
                      valueListenable: _advancedDrawerController,
                      builder: (_, value, __) {
                        return AnimatedSwitcher(
                          duration: Duration(milliseconds: 250),
                          child: Icon(
                            value.visible ? Icons.clear : Icons.menu,
                            color: Style.whitecolor,
                            size: 30,
                            key: ValueKey<bool>(value.visible),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            homemenu(),
          ],
        ),
      ),
    );
  }

  Widget listView() {
    return Container(
      color: Color(0xFFFFF9E9),
      child: Column(
        children: [
          AppBanner(),
          AddBanner(),
          MenuSlider(),
          ProgressCircles(),
          ImageView(),
          SmallBanner(),
          LatestMovies(),
          MusicSlider(),
          OfferBanner(),
          NewsSlider(),
          EnjoyGaming(),
          JobEducation(),
          StackedBanner(),
          Tickets(),
          NewConnection(),
          FeaturedOffer(),
          TabView(),
          HelpSupport(),
        ],
      ),
    );
  }

  Widget listViewguest() {
    return Container(
        color: Color(0xFFFFF9E9),
        child: Column(
          children: [
            AppBanner(),
            ImageView(),
          ],
        ));
  }

  main() async {
    guest.value = await loginController.main();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      main();
      Future.delayed(Duration.zero, () => showAlert(context));
    });

    final systemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: Colors.black54,
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  Widget _buildDialog(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
        ],
      );

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(width: 8.0),
          Text("+${country.phoneCode}"),
          SizedBox(width: 8.0),
          Flexible(child: Text(country.name))
        ],
      );

  void _openCountryPickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.pink),
          child: CountryPickerDialog(
            titlePadding: EdgeInsets.all(8.0),
            searchCursorColor: Colors.pinkAccent,
            searchInputDecoration: InputDecoration(hintText: 'Search...'),
            isSearchable: true,
            title: Text('Select your phone code'),
            onValuePicked: (Country country) =>
                setState(() => _selectedDialogCountry = country),
            itemBuilder: _buildDialogItem,
            priorityList: [
              CountryPickerUtils.getCountryByIsoCode('TR'),
              CountryPickerUtils.getCountryByIsoCode('US'),
            ],
          ),
        ),
      );
  Future<void> logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs?.setBool("guest", false);
    Get.to(HomeScreen());
  }

// Future<bool> main() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    var status = prefs.getBool('guest') == true;
//    return status;
//   //  if(prefs.getBool('guest') == true){
//   //    listViewguest();
//   //  }
//   //  else{
//   //    listView();
//   //  }
//   // var isLoggedIn = (prefs.getBool('isLoggedIn') == true) ? false : prefs.getBool('isLoggedIn');
//   //  Container(
//   //    child: status ? listView() : listViewguest(),
//   //  );
// }
//   Future<bool> _loadCounter() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _email = (prefs.getString('guest')??'');
//     });
//   }

}
