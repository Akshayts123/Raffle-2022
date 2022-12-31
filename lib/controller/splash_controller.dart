import 'dart:async';

import 'package:draw_idea/views/pages/home/home.dart';
import 'package:draw_idea/views/pages/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import '../views/pages/home/data.dart';
import '../views/pages/home/fade.dart';
import '../views/pages/home/text.dart';
import '../views/pages/on_board/on_board.dart';
import '../views/pages/qr_code/qr_code.dart';

import '../views/pages/register_login/loginPage.dart';
import '../views/pages/register_login/signup.dart';
import '../views/pages/register_login/welcomePage.dart';

class SplashController extends GetxController {
  final splashDelay = 5;

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, checkFirstSeen);
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _introSeen = (prefs.getBool('intro_seen') ?? false);
    var status = prefs.getBool('isLoggedIn') ?? false;

    if (FirebaseAuth.instance.currentUser != null && _introSeen) {
      Get.to(text());
    } else if (_introSeen) {
      Get.to(LoginPage());
    } else {
      await prefs.setBool('intro_seen', true);
      Get.to(OnBoardingPage());
    }
  }

  // Future checkFirstSeen() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool _introSeen = (prefs.getBool('intro_seen') ?? false);
  //   var status = prefs.getBool('isLoggedIn') ?? false;
  //
  //   if (status && _introSeen) {
  //     Get.to(HomeScreen());
  //   } else if (_introSeen) {
  //     Get.to(LoginPage());
  //   } else {
  //     await prefs.setBool('intro_seen', true);
  //     Get.to(OnBoardingPage());
  //   }
  // }
  // void navigateUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var status = prefs.getBool('isLoggedIn') ?? false;
  //   print(status);
  //   if (status) {
  //     Get.to(HomeScreen());
  //   } else {
  //     await prefs?.setBool("isLoggedIn", true);
  //     Get.to(LoginPage());
  //   }
  // }

  @override
  void onInit() {
    _loadWidget();
    // navigateUser();
    super.onInit();
  }
}
