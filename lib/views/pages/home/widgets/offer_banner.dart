

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controller/home_controller.dart';
import '../../../../utils/style.dart';

Widget OfferBanner(){
  final HomeController _coffeeController = Get.find();
  return Container(
    color: Style.systemblue,
    margin: EdgeInsets.only(top: 10),
    padding: EdgeInsets.only(left: 10, top: 5),
    height: 160,
    child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              Container(
                // padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                alignment: Alignment.topCenter,
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 9),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 80,
                                height: 18,
                                decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Center(
                                    child: Text(
                                      "Special offer",
                                      style: GoogleFonts.poppins(
                                          fontSize: 11, fontWeight: FontWeight.bold),
                                    )),
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                child: FractionalTranslation(
                                  translation: Offset(-0.3, -0.15),
                                  child: Container(
                                    child: Image.asset(
                                      "assets/metior.gif",
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 0,
                          ),
                          Container(
                            child: Text("6 OTT'S in 1 app!",
                                style: GoogleFonts.poppins(
                                    fontSize: 17,
                                    color: Style.whitecolor,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            width: 190,
                            child: Text(
                              "Flutter is an open source framework by Google for building beautiful",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                          Container(
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.only(top: 10),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Row(
                                children: [
                                  Text("Stream at \$10 ",
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color:Style.whitecolor,
                                      )),
                                  Icon(
                                    Icons.keyboard_double_arrow_right,
                                    size: 20,
                                    color: Style.whitecolor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            child: Container(
              alignment: Alignment.topRight,
              child: FractionalTranslation(
                translation: Offset(0.92, -0.23),
                child: Container(
                  width: 190.0,
                  height: 200.0,
                  child: Image.asset(
                    "assets/gift.png",
                    width: 190.0,
                    height: 190.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ]),
  );
}