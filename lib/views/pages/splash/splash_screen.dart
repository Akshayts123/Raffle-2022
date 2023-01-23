
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../controller/splash_controller.dart';
import '../../../utils/style.dart';

class splashscreen extends StatelessWidget {
  splashscreen({Key? key}) : super(key: key);
  final cartController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:context.theme.cardColor,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Image.asset(
            'assets/RW.png',
            // width: 70.0,
            // height: 70.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

