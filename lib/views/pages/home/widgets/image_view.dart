

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controller/home_controller.dart';
import '../../../../utils/style.dart';
Widget ImageView(){
  final HomeController _coffeeController = Get.find();
  return Container(
    child:  Column(
      children: [
        Container(
          height: 200,
          padding:Pods.TOP_SMALL_PADDING,
          child: ListView.builder(
            shrinkWrap: true,
            padding: Pods.LEFT_WIDE_PADDING,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: _coffeeController.getHomesList.length,
            itemBuilder: (BuildContext context, int index) => Container(
              padding: EdgeInsets.only(right: 15),
              child:  Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(_coffeeController.getHomesList[index]
                      .banner ??
                      "",
                      fit: BoxFit.cover,
                      height: 200,
                      width: 330),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}