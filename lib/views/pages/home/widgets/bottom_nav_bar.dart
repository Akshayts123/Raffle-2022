
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/home_controller.dart';
import '../../../../utils/style.dart';
import '../../Coupens/coupens.dart';
import '../../Deals/catogories.dart';
import '../home_screen.dart';

class Bottom_nav extends StatefulWidget {
  const Bottom_nav({Key? key}) : super(key: key);

  @override
  State<Bottom_nav> createState() => _Bottom_navState();
}

class _Bottom_navState extends State<Bottom_nav> with TickerProviderStateMixin {
  final HomeController _coffeeController = Get.find();
  // final iconList = <IconData>[
  //   Icons.dashboard,
  //   Icons.notifications,
  //   Icons.discount,
  //   Icons.account_circle,
  // ];
  // var bottomNavIndex = 0;
  // late AnimationController fabAnimationController;
  // late AnimationController borderRadiusAnimationController;
  // late Animation<double> fabAnimation;
  // late Animation<double> borderRadiusAnimation;
  // late CurvedAnimation fabCurve;
  // late CurvedAnimation borderRadiusCurve;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: _coffeeController.iconList.length,
      tabBuilder: (int index, bool isActive) {
        final color = isActive ? Style.systemblue : Style.greycolor;
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _coffeeController.iconList[index],
              size: 24,
              color: color,
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                HomeController.reportReasons[index],
                maxLines: 1,
                style: TextStyle(color: color),

              ),
            )
          ],
        );
      },
      backgroundColor: Style.backgroundwhite,
      activeIndex: _coffeeController.bottomNavIndex,
      splashColor: Style.systemblue,
      notchAndCornersAnimation:_coffeeController. borderRadiusAnimation,
      splashSpeedInMilliseconds: 800,
      splashRadius: 30,
      notchSmoothness: NotchSmoothness.defaultEdge,
      gapLocation: GapLocation.center,
      onTap: (index) {
        setState(() {
          _coffeeController.bottomNavIndex = index;
          (_coffeeController.bottomNavIndex == 1)
              ? Get.to( Catogories())
              : (_coffeeController.bottomNavIndex == 2)
              ? Get.to(ScrachCoupens())
              : (_coffeeController.bottomNavIndex == 3)
              ? Get.to(HomeScreen())
              : Get.to(HomeScreen());
        });
      },
    );
  }
  @override
  void initState() {
    super.initState();

    final systemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: Colors.black54,
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);

    _coffeeController.fabAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _coffeeController.borderRadiusAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _coffeeController.fabCurve = CurvedAnimation(
      parent: _coffeeController.fabAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    _coffeeController.borderRadiusCurve = CurvedAnimation(
      parent: _coffeeController.borderRadiusAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    _coffeeController.fabAnimation = Tween<double>(begin: 0, end: 1).animate(_coffeeController.fabCurve);
    _coffeeController.borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      _coffeeController.borderRadiusCurve,
    );



    // Future.delayed(
    //   Duration(seconds: 1),
    //       () =>_coffeeController. fabAnimationController.forward(),
    // );
    // Future.delayed(
    //   Duration(seconds: 1),
    //       () => _coffeeController.borderRadiusAnimationController.forward(),
    // );
  }

}
