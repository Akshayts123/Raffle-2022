import 'package:draw_idea/views/pages/home/stacked_banner.dart';
import 'package:draw_idea/views/pages/home/text.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/home_controller.dart';
import '../../widgets/drawer/drawer.dart';

import '../splash/splash_screen.dart';
import 'app_banner.dart';
import 'enjoy_gaming.dart';
import 'home_buttons.dart';
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

        ),
      ),
      );
    });
  }

  Widget _buildLeft() {
    return Container(
      child: Center(
        child: Text('LEFT PART'),
      ),
    );
  }

  Widget _buildRight() {
    return Container(
      child: Center(
        child: Icon(Icons.airplanemode_active),
      ),
    );
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
