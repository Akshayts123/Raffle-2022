import 'dart:developer';

import 'package:draw_idea/utils/style.dart';
import 'package:draw_idea/views/pages/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_image_icon.dart';
import '../Coupens/coupens.dart';
import '../Deals/catogories.dart';
import '../job_portal/job_home.dart';
import '../offers/offer_screen.dart';
import '../services/service_home.dart';
import 'home_screen.dart';

class MainScreen extends HookWidget {
  MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final indexState = useState(0);
    final bottomState = useState(true);
    final controller = useScrollController();
    final location = useState('');
    final screens = [
      HomeScreen(),
      Catogories(),
      ScrachCoupens(),
      // OffersScreen(),
      JobHome(),
      ServicePage(),

    ];
    return  WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        key: scaffoldKey,
        body: screens[indexState.value],
        bottomNavigationBar: SizedBox(
          height: 60,
          child: BottomNavigationBar(
            fixedColor: Colors.black,
            selectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
            currentIndex: indexState.value,
            onTap: (e) {
              indexState.value = e;
              // indexState.value = e;
              // if (e == 0) {
              // bottom();
              if (controller.position.pixels != 0.0) {
                controller.animateTo(
                  0.0,
                  duration: Duration(seconds: 1),
                  curve: Curves.easeIn,
                );
              }
              // }
            },
            showUnselectedLabels: true,
            showSelectedLabels: true,
            items: [
              BottomNavigationBarItem(
                label: "Home",
                tooltip: "Home",
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
                label: "Categories",
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
                label: "Coupons",
                icon: iconAssetImage(
                  "assets/coupon.png",
                  32,
                  Style.greycolor,
                ),
                activeIcon: iconAssetImage(
                  "assets/coupon.png",
                  null,
                  Style.systemblue,
                ),
              ),
              BottomNavigationBarItem(
                label: "Offers",
                icon: iconAssetImage(
                  "assets/discount.png",
                  null,
                  Style.greycolor,
                ),
                activeIcon: iconAssetImage(
                  "assets/discount.png",
                  null,
                  Style.systemblue,
                ),
              ),
              BottomNavigationBarItem(
                label: "Services",
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
      ),
    );
  }
}
