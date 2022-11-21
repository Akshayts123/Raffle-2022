

import 'package:draw_idea/views/pages/home/home_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import '../views/pages/bindings/home_bindings.dart';
import '../views/pages/home/home.dart';
import '../views/pages/splash/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: "/splash_screen",
      page: () => splashscreen(),
      binding: BaseBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: "/home_screen",
      page: () => Home(),
      binding: BaseBindings(),
    ),

  ];
}