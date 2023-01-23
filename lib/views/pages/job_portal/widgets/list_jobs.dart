

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/home_controller.dart';
import '../job_screen_2.dart';
import 'designation.dart';

class JobsList extends StatelessWidget {
   JobsList({Key? key}) : super(key: key);
  final HomeController _coffeeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(10),
      scrollDirection: Axis.vertical,
      itemCount: _coffeeController.designation.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        onTap: () {
          Get.to(
            JobInnerScreen(
              Images1:  _coffeeController
                  .getHomesList[index].services ??
                  "",
              description: _coffeeController.studio[index],
              designation: _coffeeController.designation[index],
            ),
          );
        },
        child: Container(
          width: double.infinity,
          height: 140,
          margin: EdgeInsets.only(bottom: 10),
          child: Card(elevation: 2, child: Designation( index: index,),),
        ),
      ),
    );
  }
}
