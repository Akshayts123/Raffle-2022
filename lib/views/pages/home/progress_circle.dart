import 'package:draw_idea/views/pages/home/second_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/style.dart';

class ProgressCircles extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
   ProgressCircles({super.key, });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Your Cources",
                  style: Style.mainheading,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: RawMaterialButton(
                  onPressed: () {},
                  constraints: BoxConstraints(),
                  elevation: 0.0,
                  fillColor: Style.whitecolor,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Style.blackcolor),
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(
                      Icons.chevron_right,
                      size: 20,
                    ),
                  ),
                  padding: EdgeInsets.all(0.0),
                  shape: CircleBorder(),
                ),
              ),
            ],
          ),
          Container(
            height: 120,
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 15, right: 0, bottom: 0),
              scrollDirection: Axis.horizontal,
              itemCount:_coffeeController.getHomesList.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => InkWell(
                onTap: (){
                  Get.to(SecondPage(courcemodel:_coffeeController.getHomesList[index], courcecolor: _coffeeController.CourceColor[index] ,)
                  );

                },
                child: Container(
                  padding: EdgeInsets.only(right: 10),
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
                            style: GoogleFonts.poppins(
                                fontSize: 17,
                                color: Style.whitecolor,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            _coffeeController.getHomesList[index].courcesub??"",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Style.whitecolor,
                                fontWeight: FontWeight.w500),
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
                                    style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        color: Style.whitecolor,
                                        fontWeight: FontWeight.w500),
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
