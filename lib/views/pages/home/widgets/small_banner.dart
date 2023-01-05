

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controller/home_controller.dart';
import '../../../../utils/style.dart';
Widget SmallBanner(){
  final HomeController _coffeeController = Get.find();
  var banner =true;
  return Container(
    child: Column(
      children: [
        Container(
          height: 160,

          child: ListView.builder(
              padding: EdgeInsets.only(top: 20,left: 13),
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: _coffeeController.getHomesList.length ,
              itemBuilder: (BuildContext context, int index) {
                if (index == 1 )
                {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 160,
                                height: 140,
                                child: Card(
                                  color: Colors.black45,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(15),
                                            bottomLeft: Radius.circular(15)
                                        ),
                                        child: SizedBox(
                                          width: 170,
                                          height: 105,
                                          child: Image.asset(
                                            _coffeeController
                                                .getHomesList[index].offer ??
                                                "",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          'Sony LIV for 1 year ',
                                          style: GoogleFonts.poppins(
                                              fontSize: 10,
                                              color: Style.whitecolor,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
                if (index == 4  )
                {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 160,
                                height: 140,
                                child: Card(
                                  color: Colors.black45,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(15),
                                            bottomLeft: Radius.circular(15)
                                        ),
                                        child: SizedBox(
                                          width: 170,
                                          height: 105,
                                          child: Image.asset(
                                            _coffeeController
                                                .getHomesList[index].offer ??
                                                "",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          'Sony LIV for 1 year ',
                                          style: GoogleFonts.poppins(
                                              fontSize: 10,
                                              color: Style.whitecolor,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),

                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
                if (index ==7  )
                {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 160,
                                height: 140,
                                child: Card(
                                  color: Colors.black45,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(15),
                                            bottomLeft: Radius.circular(15)
                                        ),
                                        child: SizedBox(
                                          width: 170,
                                          height: 105,
                                          child: Image.asset(
                                            _coffeeController
                                                .getHomesList[index].offer ??
                                                "",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          'Sony LIV for 1 year ',
                                          style: GoogleFonts.poppins(
                                              fontSize: 10,
                                              color: Style.whitecolor,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),

                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 160,
                              height: 140,
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Column(
                                  children: [

                                    SizedBox(
                                      width: 170,
                                      height: 75,
                                      child: Image.asset(
                                        _coffeeController.getHomesList[index]
                                            .offer ??
                                            "",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Column(children: [
                                        Text(
                                          'On \$3099 recharge',
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          'Using Credit Card',
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ]),
                                    )
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
          ),
        ),
      ],
    ),
  );

}