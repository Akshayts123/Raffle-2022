import 'package:draw_idea/controller/search_controller.dart';
import 'package:draw_idea/controller/splash_controller.dart';
import 'package:draw_idea/views/pages/splash/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../../../controller/home_controller.dart';

class BaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(SplashController());
    Get.put(SearchController());
  }
}