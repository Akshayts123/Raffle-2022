
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/style.dart';
import 'coupens.dart';

class openScrach extends StatelessWidget {
  final index;
  final HomeController _coffeeController = Get.find();
   openScrach({Key? key, this.index }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(
                          context, ScrachCoupens);
                      // if(closing! > 15 && courseid == index){
                      //   scratchKey.currentState?. reveal() ;
                      // }else{
                      //   Navigator.pop(context, ScrachCoupens);
                      // }
                    },
                    child: Icon(
                      Icons.close,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.expand_circle_down_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.more_vert,
                        size: 30,
                        color: Colors.white,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Center(
                child: Stack(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // image: DecorationImage(
                        //   image: AssetImage(
                        //         _coffeeController.getHomesList[index]
                        //           .game ?? ""),
                        //   fit: BoxFit.cover,
                        // ),
                        border: Border.all(
                            width: 1,
                            color: Colors.grey),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Container(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: DefaultTextStyle(
                                style: TextStyle(
                                    decoration:
                                    TextDecoration
                                        .none),
                                child: Text(
                                  "25% upto \$500",
                                  style: GoogleFonts
                                      .poppins(
                                      fontSize: 30,
                                      color: Style
                                          .blackcolor,
                                      fontWeight:
                                      FontWeight
                                          .w500),
                                ),
                              ),
                            ),
                            Container(
                              child: DefaultTextStyle(
                                style: TextStyle(
                                    decoration:
                                    TextDecoration
                                        .none),
                                child: Text(
                                  "off on your 1st 5 uber rides",
                                  style: GoogleFonts
                                      .poppins(
                                      fontSize: 13,
                                      color: Style
                                          .blackcolor,
                                      fontWeight:
                                      FontWeight
                                          .w500),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Stack(
                              clipBehavior: Clip.none,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration:
                                        BoxDecoration(
                                          borderRadius:
                                          BorderRadius
                                              .all(
                                            Radius.circular(
                                                100.0),
                                          ),
                                        ),
                                        child:
                                        ClipRRect(
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                              100),
                                          child: Image
                                              .asset(
                                            _coffeeController
                                                .getHomesList[index]
                                                .scrach ??
                                                "",
                                            width: 50.0,
                                            height:
                                            50.0,
                                            fit: BoxFit
                                                .cover,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: -20,
                                  right: -10,
                                  child: Container(
                                    child: Image.asset(
                                      "assets/staring.jpg",
                                      width: 80.0,
                                      height: 80.0,
                                      fit: BoxFit
                                          .contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                )),
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.only(
                      topRight:
                      Radius.circular(
                          15),
                      topLeft:
                      Radius.circular(
                          15))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration:
                        BoxDecoration(
                          borderRadius:
                          BorderRadius.all(
                            Radius.circular(
                                100.0),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius:
                          BorderRadius
                              .circular(
                              100),
                          child: Image.asset(
                            _coffeeController
                                .getHomesList[
                            index]
                                .scrach ??
                                "",
                            width: 50.0,
                            height: 50.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        child: DefaultTextStyle(
                          style: TextStyle(
                              decoration:
                              TextDecoration
                                  .none),
                          child: Text(
                            "Uber",
                            style: GoogleFonts
                                .poppins(
                                fontSize: 17,
                                color: Style
                                    .greycolor,
                                fontWeight:
                                FontWeight
                                    .w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: DefaultTextStyle(
                      style: TextStyle(
                          decoration:
                          TextDecoration
                              .none),
                      child: Text(
                        "Congrats! 25% upto \$500 off on your 1st 5 uber rides",
                        style: GoogleFonts
                            .poppins(
                            fontSize: 22,
                            color: Style
                                .blackcolor,
                            fontWeight:
                            FontWeight
                                .w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: DefaultTextStyle(
                      style: TextStyle(
                          decoration:
                          TextDecoration
                              .none),
                      child: Text(
                        "Copy code and use at checkout",
                        style: GoogleFonts
                            .poppins(
                            fontSize: 14,
                            color: Style
                                .blackcolor,
                            fontWeight:
                            FontWeight
                                .w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // if(DateTime(2021, 12, 20) == _coffeeController.getHomesList[index].date){
                        //   isExpired = false;
                        // }else{
                        //   isExpired = true;
                        //   Redeem();
                        // }
                        //
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.redeem,color: Colors.white,),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Redeem Now"),
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
    );
  }
}
