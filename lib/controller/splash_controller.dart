

import 'dart:async';

import 'package:draw_idea/views/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/pages/home/home.dart';
import '../views/pages/home/new.dart';
import '../views/pages/home/text.dart';

class SplashController extends GetxController{

  void onInit() {
    Timer(
        Duration(seconds: 5),
            () =>  Get.to(text()));
        super.onInit();
  }
}