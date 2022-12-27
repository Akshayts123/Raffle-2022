import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/style.dart';

class trendingnews extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
  trendingnews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: Text(
                  "Trending news",
                  style:Style.mainheading,
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
                          color: Colors.white70,
                          image: DecorationImage(
                            image: AssetImage(
                              _coffeeController.getHomesList[index].news ?? "",
                            ),
                            fit: BoxFit.scaleDown,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(100.0)),
                          border: Border.all(
                            color: Color(0xFFFFF8E1),
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
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Style.whitecolor,
                                    fontWeight: FontWeight.w600),
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
}
