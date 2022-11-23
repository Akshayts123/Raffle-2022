import 'package:draw_idea/views/pages/home/stacked_banner.dart';
import 'package:draw_idea/views/widgets/search/search1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import '../../../controller/home_controller.dart';
import '../../widgets/drawer/drawer.dart';
import '../../widgets/flags/flags.dart';
import '../../widgets/search/search.dart';
import '../splash/splash_screen.dart';
import 'app_banner.dart';
import 'enjoy_gaming.dart';
import 'home_buttons.dart';
import 'image_carousel.dart';
import 'job_education.dart';
import 'latest_movies.dart';
import 'menu_slider.dart';
import 'music_slider.dart';
import 'new_connection.dart';
import 'news_slider.dart';
import 'offer_banner.dart';

class Home extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
  final AdvancedDrawerController _advancedDrawerController =
      AdvancedDrawerController();

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (HomeController) {
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

          child: Scaffold(
          body: SingleChildScrollView(
            controller: _coffeeController.controller,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Stack(
              children: [
                Container(
                  color: Color(0xFFED2736),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            top: 190,
                            left: 0,
                            right: 0,
                            // bottom: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFFFF8E1),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0))),
                              height: 110,
                              width: 120,
                            ),
                          ),
                          // Positioned(
                          //   right: 0,
                          //   top: 20,
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //         color: Color(0xFFFFF8E1),
                          //         borderRadius: BorderRadius.only(
                          //             topLeft: Radius.circular(10.0),
                          //             bottomLeft: Radius.circular(10.0))),
                          //     height: 60,
                          //     width: 120,
                          //   ),
                          // ),
                          SizedBox(
                            height: 210,
                          ),
                          Positioned(
                            top: 175,
                            left: 17,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(15)),
                              width: 60,
                              height: 5,
                            ),
                          ),
                          Positioned(
                            child: Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                children: [
                                  _appbar(),
                                  homemenu(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        color: Color(0xFFFFF8E1),
                        // height: 600,
                        child: Column(
                          children: [
                            appbanner(),
                            menuslider(),
                            imagecarousel(),
                            latestmovies(),
                            trendingmusic(),
                            specialoffer(),
                            trendingnews(),
                            enjoygaming(),
                            jobeducation(),
                            stackedbanner(),
                            newconnection(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
             ),

          bottomNavigationBar: StylishBottomBar(
            items: [
              AnimatedBarItems(
                  icon: TextButton(
                    onPressed: () {
                      Get.to(splashscreen());
                    },
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Icon(
                      Icons.house_outlined,
                      color: Colors.red,
                    ),
                  ),
                  selectedIcon: Icon(
                    Icons.house_rounded,
                  ),
                  selectedColor: Colors.red,
                  backgroundColor: Colors.tealAccent,
                  title: const Text('Home')),
              AnimatedBarItems(
                  icon: TextButton(
                    onPressed: () {
                      Get.to(Home());
                    },
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Icon(
                      Icons.star_border_rounded,
                      color: Colors.grey,
                    ),
                  ),
                  selectedIcon: const Icon(Icons.star_rounded),
                  selectedColor: Colors.red,
                  backgroundColor: Colors.lightGreenAccent,
                  title: const Text('Star')),
              AnimatedBarItems(
                  icon: const Icon(
                    Icons.style_outlined,
                  ),
                  selectedIcon: const Icon(
                    Icons.style,
                  ),
                  backgroundColor: Colors.amber,
                  selectedColor: Colors.red,
                  title: const Text('Style')),
              AnimatedBarItems(
                  icon: const Icon(
                    Icons.person_outline,
                  ),
                  selectedIcon: const Icon(
                    Icons.person,
                  ),
                  backgroundColor: Colors.purpleAccent,
                  selectedColor: Colors.red,
                  title: const Text('Profile')),
            ],
            iconSize: 32,
            barAnimation: BarAnimation.blink,
            iconStyle: IconStyle.Default,
            hasNotch: true,
            fabLocation: StylishBarFabLocation.center,
            opacity: 0.3,
            currentIndex: _coffeeController.selected ?? 0,
            onTap: (index) {
              _coffeeController.controller.jumpToPage(index!);
              _coffeeController.selected;
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _coffeeController.heart;
            },
            backgroundColor: Colors.white,
            child: Icon(
              _coffeeController.heart
                  ? CupertinoIcons.creditcard_fill
                  : CupertinoIcons.creditcard,
              color: Colors.grey,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
      );
    });
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }

  Widget _appbar() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Row(
              children: [
                Column(
                  children: [
                    flags(),
                  ],
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 20,
                  color: Colors.white,
                )
              ],
            ),
          ),
          Container(
            child: Center(
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  search(),
                  IconButton(
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
