import 'package:draw_idea/views/pages/home/widgets/add_banner_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/style.dart';

class AddBanner extends StatefulWidget {
  AddBanner({Key? key}) : super(key: key);

  @override
  State<AddBanner> createState() => _AddBannerState();
}

class _AddBannerState extends State<AddBanner> {
  final HomeController _coffeeController = Get.find();

  var rating = 0.0.obs;

  bool isBluetoothOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
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
}
