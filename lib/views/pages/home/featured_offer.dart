import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/style.dart';

class featuredoffer extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
  featuredoffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Pods.TOP_PADDING,
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: Pods.LEFT_PADDING,
                  child: Text(
                    "featured offers for you",
                    style: Style.mainheading,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 0.0),
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
          ),
          Container(
            height: 185,
            margin: EdgeInsets.only(
              bottom: 15,),

            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              padding: Pods.LEFT_WIDE_PADDING,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(top: 60,  right: 15),
                  width: 210,
                  height: 190,
                  decoration: BoxDecoration(
                    color: _coffeeController.coloring[index],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Transform.translate(
                          child: Image.asset(
                            _coffeeController.getHomesList[index].feature??"",
                            width: 100.0,
                            height: 160.0,
                            fit: BoxFit.cover,
                          ),
                          offset: Offset(0, -80),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Transform.translate(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "International Roaming ",
                                      style: GoogleFonts.poppins(
                                          fontSize: 17,
                                          color: (index == 9)
                                              ? Style.whitecolor
                                              : (index == 8)
                                                  ? Style.blackcolor
                                                  : (index % 2 == 0)
                                                      ?Style.whitecolor
                                                      : Style.blackcolor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Container(
                                    width: 200,
                                    child: Text(
                                      "Unlimited calls & datas for 28 days international destinations",
                                      style: GoogleFonts.poppins(
                                          fontSize: 11,
                                          color:  (index == 9)
                                              ? Style.whitecolor
                                              : (index == 8)
                                              ? Style.blackcolor
                                              : (index % 2 == 0)
                                              ? Style.whitecolor
                                              : Style.blackcolor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          offset: Offset(0, 20),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
