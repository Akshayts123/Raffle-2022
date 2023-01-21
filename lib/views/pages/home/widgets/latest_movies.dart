

import 'package:draw_idea/views/pages/Deals/widgets/catogory_heading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controller/home_controller.dart';
import '../../../../utils/style.dart';
import '../../../widgets/more/more.dart';

class LatestMovies extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
   LatestMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10,top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Heading(text: "Latest Movies",)
                ),
                more()
              ],
            ),
          ),
          Container(
            height: 220,
            child: ListView.builder(
              padding: EdgeInsets.only(top:15,left: 30),
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: _coffeeController.getHomesList.length,
              itemBuilder: (BuildContext context, int index) => Container(
                padding: EdgeInsets.only(left: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 30),
                      // padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      alignment: Alignment.topCenter,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            // margin: EdgeInsets.only(top: 30),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                _coffeeController.getHomesList[index].movie ??
                                    "",
                                height: 200,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                // Container(
                                //   alignment: Alignment.topLeft,
                                //   child: FractionalTranslation(
                                //     translation: Offset(-0.5, 0),
                                //     child: Row(
                                //       children: [
                                //         Image.asset(
                                //           _coffeeController
                                //               .getHomesList[index].no ??
                                //               "",
                                //           height: 55,
                                //           color:Style.whitecolor,
                                //           width: 55,
                                //           fit: BoxFit.cover,
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: FractionalTranslation(
                                    translation: Offset(-0.5, 0),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          _coffeeController
                                              .getHomesList[index].no2 ??
                                              "",
                                          height: 55,
                                          color:  Style.systemblue,
                                          width: 55,
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
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
}

