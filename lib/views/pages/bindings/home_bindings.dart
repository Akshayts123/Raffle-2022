import 'package:draw_idea/controller/search_controller.dart';
import 'package:draw_idea/views/pages/splash/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../controller/category_controller.dart';
import '../../../controller/coupen_controller.dart';
import '../../../controller/home_controller.dart';
import '../../../controller/register_controller.dart';
import '../../../controller/splash_controller.dart';
import '../../../services/api_service.dart';
import '../../../utils/app_constants.dart';

class BaseBindings implements Bindings {
  @override
  void dependencies() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    Get.lazyPut(() => sharedPreferences);
    Get.put(HomeController());
    Get.put(SplashController());
    Get.put(SearchController());
    Get.put(RegisterController());
    Get.put(CoupenController());
    Get.put(CategoryController());
  }
}