
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/home_controller.dart';
import '../../../../utils/style.dart';
import 'add_banner_widget.dart';

Widget AddBanner(){
  final HomeController _coffeeController = Get.find();

  var rating = 0.0.obs;

  bool isBluetoothOn = false;
  return Container(
    height: 250,
    padding: Pods.TOP_PADDING,
    child: ListView.builder(
      padding: Pods.LEFT_PADDING,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: _coffeeController.getHomesList.length,
      itemBuilder: (BuildContext context, int index) => AddBannerWidget(
        index: index,
      ),
    ),
  );
}