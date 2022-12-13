
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';


class imageview extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
  imageview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Column(
        children: [
          Container(
            height: 200,
            padding: EdgeInsets.only(top: 15,bottom: 15),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 20),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: _coffeeController.getHomesList.length,
              itemBuilder: (BuildContext context, int index) => Container(
                margin: EdgeInsets.only(right: 15),
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
}
