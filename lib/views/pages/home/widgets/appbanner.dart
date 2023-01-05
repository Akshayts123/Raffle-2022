

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../../controller/home_controller.dart';
import '../../../../utils/style.dart';

Widget AppBanner(){
  final HomeController _coffeeController = Get.find();
  return Shimmer(
    duration: Duration(seconds: 3), //Default value
    interval: Duration(seconds: 3), //Default value: Duration(seconds: 0)
    color: Style.whitecolor, //Default value
    colorOpacity: 0, //Default value
    enabled: true, //Default value
    direction: ShimmerDirection.fromLTRB(), //Default Value
    child: Container(
      height: 300,
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 6),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: _coffeeController.getHomesList.length,
        itemBuilder: (BuildContext context, int index) => Container(
          padding: EdgeInsets.zero,
          child: Row(
            children: [
              Container(
                child: TextButton(
                  style: ButtonStyle(),
                  onPressed: () {},
                  child: Stack(
                    children: [
                      RawMaterialButton(
                        onPressed: () {},
                        constraints: BoxConstraints(),
                        elevation: 5.0,
                        fillColor: Style.whitecolor,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            _coffeeController.getHomesList[index].vector ??
                                "",
                            width: 280.0,
                            height: 280.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Transform.translate(
                          offset: Offset(10, -5),
                          child: (index % 2 == 0)
                              ? TextButton(
                            onPressed: () {},
                            child: Container(
                              height: 45,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Style.systemblue,
                                  borderRadius:
                                  BorderRadius.circular(30)),
                              child: Center(
                                  child: Text(
                                    "Watch Now",
                                    style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        color: Style.whitecolor,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ),
                          )
                              : TextButton(
                            onPressed: () {},
                            child: Container(
                              height: 45,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius:
                                  BorderRadius.circular(30)),
                              child: Center(
                                  child: Text(
                                    "Watch Now",
                                    style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        color: Style.blackcolor,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}