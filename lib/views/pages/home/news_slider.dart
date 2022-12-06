

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';

class trendingnews extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
   trendingnews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "trending news",
                  style: GoogleFonts.poppins(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              RawMaterialButton(
                onPressed: () {},
                constraints: BoxConstraints(),
                elevation: 2.0,
                fillColor: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(30)),
                  child: Icon(
                    Icons.chevron_right,
                    size: 20,
                  ),
                ),
                padding: EdgeInsets.all(0.0),
                shape: CircleBorder(),
              ),
            ],
          ),
          Container(
            height: 130,
            margin: EdgeInsets.only(
              top: 15,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: _coffeeController.getHomesList.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) =>
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    width: 125.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(70.0)),
                      border: Border.all(
                        color: Colors.white,
                        width: 9.0,
                      ),
                    ),
                    child: Container(
                      width: 30.0,
                      height: 30.0,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                            image: AssetImage(
                              _coffeeController.getHomesList[index].news??"",
                              
                            ),
                            fit: BoxFit.scaleDown,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(70.0)),
                          border: Border.all(
                            color: Color(0xFFFFF8E1),
                            width: 3.0,
                          )),
                      child: Container(
                        alignment: Alignment.center,
                        child: FractionalTranslation(
                            translation: Offset(0, 3.13),
                            child: Container(
                                height: 18,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Center(
                                  child: Text(
                                    "LIVE",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ))),
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
