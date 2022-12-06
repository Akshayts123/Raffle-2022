import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:draw_idea/views/pages/home/small_banner.dart';
import 'package:draw_idea/views/pages/home/stacked_banner.dart';
import 'package:draw_idea/views/pages/home/text.dart';
import 'package:country_pickers/country.dart';
import 'package:draw_idea/views/pages/home/tickets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../controller/home_controller.dart';
import '../../widgets/drawer/drawer.dart';
import 'app_banner.dart';
import 'featured_offer.dart';
import 'help_support.dart';
import 'image_view.dart';
import 'searchbar.dart';
import 'enjoy_gaming.dart';
import 'home_buttons.dart';
import 'job_education.dart';
import 'latest_movies.dart';
import 'menu_slider.dart';
import 'music_slider.dart';
import 'new_connection.dart';
import 'news_slider.dart';
import 'offer_banner.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  var variable = 0;
  final HomeController _coffeeController = Get.find();
  String page = 'Blue';
  bool folded = true;
  final hiding = true;
  final AdvancedDrawerController _advancedDrawerController =
      AdvancedDrawerController();
  // final autoSizeGroup = AutoSizeGroup();
  var _bottomNavIndex = 0; //default index of a first screen
  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;

  final iconList = <IconData>[
    Icons.dashboard,
    Icons.notifications,
    Icons.settings,
    Icons.account_circle,
  ];
  Country _selectedDialogCountry =
  CountryPickerUtils.getCountryByPhoneCode('91');
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
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
          headerBottomBar: headerBottomBarWidget(),
          body: [
            listView(),
          ],
          headerExpandedHeight: 0.22,
          fullyStretchable: false,
          bottomNavigationBar: bottomnavbar(),
          floatingActionButton: Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
            child: FloatingActionButton(
              backgroundColor: Color(0xFFED2736),
              child: Icon(
                Icons.ac_unit,
                color: Colors.white,
              ),
              onPressed: () {
                _fabAnimationController.reset();
                _borderRadiusAnimationController.reset();
                _borderRadiusAnimationController.forward();
                _fabAnimationController.forward();
              },
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          // expandedBody: const CameraPreview(),
          backgroundColor: Color(0xFFFFF9E9),
          appBarColor: Color(0xFFED2736),
        ),
      ),
    );
  }


  Row headerBottomBarWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(left: 0, top: 30),
          decoration: BoxDecoration(
              color: Color(0xFFFFC502),
              borderRadius: BorderRadius.circular(15)),
          width: 60,
          height: 5,
        ),
      ],
    );
  }

  Widget headerWidget(BuildContext context) {
    return Container(

      height: 80,
      color: Color(0xFFED2736),
      child: Container(
        padding: EdgeInsets.only(left: 0),
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: folded ? true: false,
              leadingWidth: 70,
              elevation: 0,
              backgroundColor: Color(0xFFED2736),
              leading: folded ?  Container(
                margin: EdgeInsets.only(top: 5),
                height: 30,
                // width: 75,
                child: ListTile(
                  onTap: _openCountryPickerDialog,
                  title: _buildDialog(_selectedDialogCountry),
                ),
              ): null,
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
                            color: Colors.white,
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
            SizedBox(
              height: 10,
            ),
            homemenu(),
          ],
        ),
      ),
    );
  }


  listView() {
    return Container(
      color: Color(0xFFFFF9E9),
      child: Column(
        children: [
          appbanner(),
          menuslider(),
          imageview(),
          smallbanner(),
          latestmovies(),
          trendingmusic(),
          specialoffer(),
          trendingnews(),
          enjoygaming(),
          jobeducation(),
          stackedbanner(),
          newconnection(),
          tickets(),
          featuredoffer(),
          helpsupport()
        ],
      ),
    );
  }

  Widget bottomnavbar() {
    return AnimatedBottomNavigationBar.builder(
      itemCount: iconList.length,
      tabBuilder: (int index, bool isActive) {
        final color = isActive ? Color(0xFFED2736) : Colors.grey;
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconList[index],
              size: 24,
              color: color,
            ),
            const SizedBox(height: 4),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8),
            //   child: Text(
            //     "brightness $index",
            //     maxLines: 1,
            //     style: TextStyle(color: color),
            //
            //   ),
            // )
          ],
        );
      },
      backgroundColor: Colors.white,
      activeIndex: _bottomNavIndex,
      splashColor: Color(0xFFED2736),
      notchAndCornersAnimation: borderRadiusAnimation,
      splashSpeedInMilliseconds: 800,
      splashRadius: 30,
      notchSmoothness: NotchSmoothness.defaultEdge,
      gapLocation: GapLocation.center,
      onTap: (index) {
        setState(() {
          _bottomNavIndex = index;
          (_bottomNavIndex == 1)
              ? Get.to(HomeScreen())
              : (_bottomNavIndex == 2)
                  ? Get.to(HomeScreen())
                  : (_bottomNavIndex == 3)
                      ? Get.to(HomeScreen())
                      : Get.to(HomeScreen());
        });
      },
      hideAnimationController: _hideBottomBarAnimationController,
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  @override
  void initState() {
    super.initState();
    final systemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: Colors.black54,
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);

    _fabAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    _hideBottomBarAnimationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      Duration(seconds: 1),
      () => _fabAnimationController.forward(),
    );
    Future.delayed(
      Duration(seconds: 1),
      () => _borderRadiusAnimationController.forward(),
    );
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

}
