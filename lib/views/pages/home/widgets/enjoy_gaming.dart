
import 'package:draw_idea/views/pages/Deals/widgets/catogory_heading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:flutter/cupertino.dart';

import '../../../../controller/home_controller.dart';
import '../../../../utils/style.dart';
import '../../../widgets/more/more.dart';

Widget EnjoyGaming(){
  final HomeController _coffeeController = Get.find();
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: Pods.HEADING_PADDING,
              child: Heading(text: "Enjoy non-stop gaming",)
            ),
            more()
          ],
        ),
        Container(
          height: 180,
          child: ListView.builder(
            padding: EdgeInsets.only(top: 10,left: 5),
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 9,
            itemBuilder: (BuildContext context, int index) =>
                Container(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            child: Container(
                              height: 110,
                              width: 110,
                              decoration: BoxDecoration(
                                  color: _coffeeController.colors[index],
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                          Positioned(
                            // left: 100,
                            top: -15,
                            bottom: 15,
                            child: Image.asset(
                              _coffeeController.getHomesList[index].game??"",
                              fit: BoxFit.fill,
                            ), // replace your image with Image.assets here
                          ),
                        ],
                      ),
                      Container(
                        child: Text(
                          _coffeeController.getHomesList[index].title??"",
                          style: context.theme.textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                ),
          ),
        ),
      ],
    ),
  );
}