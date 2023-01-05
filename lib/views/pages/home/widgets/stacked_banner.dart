

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controller/home_controller.dart';
import '../../../../utils/style.dart';

Widget StackedBanner(){
  final HomeController _coffeeController = Get.find();
  return Container(
    height: 150,
    margin: EdgeInsets.only(top: 50, bottom: 0),
    child: Column(
      children: [
        Container(
          // padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
          alignment: Alignment.topCenter,
          child: Stack(
            children: <Widget>[
              Container(
                height: 100,
                color: Colors.black54,
                padding: EdgeInsets.only(left: 160, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Flutter is an open",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Style.whitecolor,
                            ),
                          ),
                          Text(
                            "source framework by Google for building beautiful",
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              color: Style.whitecolor,
                            ),),
                        ],
                      ),
                    ),
                    FractionalTranslation(
                      translation: Offset(0.045, 0.1),
                      child: Container(
                        child: TextButton(
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(50, 30),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              alignment: Alignment.centerLeft),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text("Watch now ",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Style.whitecolor,
                                      fontWeight: FontWeight.w600)),
                              Icon(
                                Icons.double_arrow_rounded,
                                size: 14,
                                color: Style.whitecolor,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: FractionalTranslation(
                        translation: Offset(0.15, -0.20),
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              "assets/bane.jpeg",
                              width: 125.0,
                              height: 125.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: FractionalTranslation(
                        translation: Offset(-0.94, -0.18),
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              "assets/reels.jpg",
                              width: 100.0,
                              height: 150.0,
                              fit: BoxFit.cover,
                            ),
                          ),
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
  );
}