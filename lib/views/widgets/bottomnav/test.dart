import 'package:draw_idea/views/widgets/bottomnav/test2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../../utils/style.dart';
import '../../../widgets/custom_image_icon.dart';
import '../../pages/Coupens/coupens.dart';
import '../../pages/Deals/catogories.dart';
import '../../pages/home/home_screen.dart';
import '../../pages/job_portal/job_home.dart';

class ScrollNav extends StatefulWidget {
  @override
  _ScrollNavState createState() => _ScrollNavState();
}

class _ScrollNavState extends State<ScrollNav> {

  int _currentIndex = 0;
  bool _isVisible = true;
  ScrollController _scrollController = ScrollController();



  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        setState(() {
          _isVisible = false;
        });
      }
      if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        setState(() {
          _isVisible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(),
      Catogories(),
      ScrachCoupens(),
      // OffersScreen(),
      JobHome(),
      // scrollist(),
      // InfiniteNav(title: '',),
      // ServicePage(),

    ];
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
               ...screens
              ],
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            bottom: _isVisible ? 0 : -kBottomNavigationBarHeight - 20,
            left: 0,
            right: 0,
            height: kBottomNavigationBarHeight + 0,
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  child: BottomNavigationBar(
                    fixedColor: context.theme.highlightColor,
                    selectedFontSize: 12,
                    unselectedItemColor: Colors.grey,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: _currentIndex,
                    onTap: _onTabTapped,
                    showUnselectedLabels: true,
                    showSelectedLabels: true,
                    items: [
                      BottomNavigationBarItem(
                        label: "HOME",

                        tooltip: "HOME",
                        icon: iconAssetImage(
                          "assets/home.png",
                          null,
                          Style.greycolor,
                        ),
                        activeIcon: iconAssetImage(
                          "assets/home.png",
                          null,
                          Style.systemblue,
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: "CATEGORIES",
                        icon: iconAssetImage(
                          "assets/categories.png",
                          null,
                          Style.greycolor,
                        ),
                        activeIcon: iconAssetImage(
                          "assets/categories.png",
                          null,
                          Style.systemblue,
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: "COUPONS",
                        icon: iconAssetImage(
                          "assets/voucher.png",
                          35,

                        ),
                        activeIcon: iconAssetImage(
                          "assets/voucher.png",
                          null,
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: "JOBS",
                        icon: iconAssetImage(
                          "assets/suitcase.png",
                          null,
                          Style.greycolor,
                        ),
                        activeIcon: iconAssetImage(
                          "assets/suitcase.png",
                          null,
                          Style.systemblue,
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: "SERVICES",
                        icon: iconAssetImage(
                          "assets/service.png",
                          null,
                          Style.greycolor,
                        ),
                        activeIcon: iconAssetImage(
                          "assets/service.png",
                          null,
                          Style.systemblue,
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   height: kBottomNavigationBarHeight,
                //   color: Colors.white,
                //   child: BottomNavigationBar(
                //     currentIndex: _currentIndex,
                //     onTap: _onTabTapped,
                //     items: [
                //       BottomNavigationBarItem(
                //         icon: Icon(Icons.home),
                //         label: 'Home',
                //       ),
                //       BottomNavigationBarItem(
                //         icon: Icon(Icons.settings),
                //         label: 'Settings',
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Page'),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings Page'),
    );
  }
}
