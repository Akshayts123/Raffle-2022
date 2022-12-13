

import 'dart:async';


import 'package:draw_idea/views/pages/home/home.dart';
import 'package:draw_idea/views/pages/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import '../views/pages/home/fade.dart';
import '../views/pages/on_board/on_board.dart';
import '../views/pages/qr_code/qr_code.dart';

import '../views/pages/register_login/welcomePage.dart';




class SplashController extends GetxController  {
  final splashDelay = 5;

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, checkFirstSeen);
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _introSeen = (prefs.getBool('intro_seen') ?? false);

    if (_introSeen) {
      Get.to(WelcomePage());
    } else {
      await prefs.setBool('intro_seen', true);
      Get.to(OnBoardingPage());
    }
  }
  @override
  void onInit() {
    _loadWidget();
        super.onInit();
  }

}