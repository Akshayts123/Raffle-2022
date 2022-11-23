

import 'dart:async';
import 'package:draw_idea/views/pages/home/home.dart';
import 'package:get/get.dart';
import '../views/pages/home/text.dart';

class SplashController extends GetxController{

  void onInit() {
    Timer(
        Duration(seconds: 5),
            () =>  Get.to(text()));
        super.onInit();
  }
}