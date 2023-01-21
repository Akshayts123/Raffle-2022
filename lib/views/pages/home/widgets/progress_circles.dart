
import 'package:flutter/cupertino.dart';

import '../../../../controller/home_controller.dart';
import 'package:draw_idea/views/pages/home/second_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../utils/style.dart';
import '../../../widgets/more/more.dart';
import '../../Deals/widgets/catogory_heading.dart';

class ProgressCircles extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
   ProgressCircles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10,),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding:  Pods.HEADING_PADDING,
                  child: Heading(text: "Your Cources",)
              ),
              more()
            ],
          ),
          Container(
            height: 120,
            child: ListView.builder(
              shrinkWrap: true,
              padding:  Pods.LEFT_PADDING,
              scrollDirection: Axis.horizontal,
              itemCount:_coffeeController.getHomesList.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => InkWell(
                onTap: (){
                  Get.to(SecondPage(courcemodel:_coffeeController.getHomesList[index], courcecolor: _coffeeController.CourceColor[index] ,)
                  );

                },
                child: Container(
                  padding: EdgeInsets.only(right: 5),
                  height: 120,
                  width: 150,
                  child: Card(
                    color: HomeController.cources[index],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(13),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _coffeeController.getHomesList[index].cources??"",
                            style:Style.text411,
                          ),
                          Text(
                              _coffeeController.getHomesList[index].courcesub??"",
                              style:Style.text511
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                child: new CircularPercentIndicator(
                                  radius: 20.0,
                                  lineWidth: 3.0,
                                  animation: true,
                                  percent:_coffeeController.percent[index],
                                  center: new Text(
                                      _coffeeController.getHomesList[index].percent??"",
                                      style:Style.text6
                                  ),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: Style.whitecolor,
                                  backgroundColor: Colors.white30,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
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

