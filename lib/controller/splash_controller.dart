

import 'dart:async';
import 'package:draw_idea/views/pages/home/home.dart';
import 'package:draw_idea/views/pages/home/home_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{

  void onInit() {
    Timer(
        Duration(seconds: 5),
            () =>  Get.to(HomeScreen()));
        super.onInit();
  }
}