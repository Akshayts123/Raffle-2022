

import 'package:draw_idea/views/pages/Deals/widgets/catogory_heading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controller/home_controller.dart';
import '../../../../utils/style.dart';
import '../../../widgets/more/more.dart';

Widget NewsSlider(){
  final HomeController _coffeeController = Get.find();
  return Container(
    // padding: EdgeInsets.only(
    //   top: 15,
    // ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: Pods.HEADING_PADDING,
              child: Heading(text: "Trending news",)
            ),
            more()
          ],
        ),
        Container(
          height: 130,
          child: ListView.builder(
            shrinkWrap: true,
            padding: Pods.LEFT_WIDE_PADDING,
            scrollDirection: Axis.horizontal,
            itemCount: _coffeeController.getHomesList.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) => Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 15),
                  width: 125.0,
                  height: 125.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                    border: Border.all(
                      color: Style.whitecolor,
                      width: 9.0,
                    ),
                  ),
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: context.theme.dividerColor,
                        image: DecorationImage(
                          image: AssetImage(
                            _coffeeController.getHomesList[index].news ?? "",
                          ),
                          fit: BoxFit.scaleDown,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                        border: Border.all(
                          color: context.theme.backgroundColor,
                          width: 4.0,
                        )),
                    child: Container(
                      alignment: Alignment.center,
                      child: FractionalTranslation(
                        translation: Offset(0, 3.13),
                        child: Container(
                          height: 18,
                          width: 35,
                          decoration: BoxDecoration(
                              color:Style.systemblue,
                              borderRadius: BorderRadius.circular(3)),
                          child: Center(
                            child: Text(
                              "LIVE",
                              style: Style.text1
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}