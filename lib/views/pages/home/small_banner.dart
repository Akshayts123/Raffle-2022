import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

import '../../../../controller/home_controller.dart';

class smallbanner extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
  smallbanner({Key? key}) : super(key: key);
  var banner =true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "Special Offers",
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
          ),
          Container(
            height: 200,
            padding: EdgeInsets.only(top: 15),
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: _coffeeController.getHomesList.length ,
              itemBuilder: (BuildContext context, int index) {
                if (index == 1 )
                {
                  return Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 170,
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
                                          height: 110,
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
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 5,
                                  margin: EdgeInsets.only(left: 10),
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
                    margin: EdgeInsets.only(left: 10),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 170,
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
                                          height: 110,
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
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 5,
                                  margin: EdgeInsets.only(left: 10),
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
                    margin: EdgeInsets.only(left: 10),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 170,
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
                                          height: 110,
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
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 5,
                                  margin: EdgeInsets.only(left: 10),
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
                  margin: EdgeInsets.only(left: 10),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 170,
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
                                      height: 6,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
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
                                elevation: 5,
                                margin: EdgeInsets.only(left: 10),
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
}
