import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';

class specialoffer extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
  specialoffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 15, top: 5),
      height: 170,
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
                              width: 90,
                              height: 20,
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
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          width: 170,
                          child: Text(
                            "Flutter is an open source framework by Google for building beautiful",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.white,
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
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                Icon(
                                  Icons.double_arrow_rounded,
                                  size: 17,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: Container(
                  //     alignment: Alignment.topRight,
                  //     child: FractionalTranslation(
                  //       translation: Offset(0.8, 0.1),
                  //       child: Container(
                  //         width: 200.0,
                  //         height: 290.0,
                  //         child: Image.asset(
                  //           "assets/box2.png",
                  //           width: 200.0,
                  //           height: 230.0,
                  //           fit: BoxFit.cover,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),

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
              translation: Offset(0.9, -0.22),
              child: Container(
                width: 200.0,
                height: 230.0,
                child: Image.asset(
                  "assets/box2.png",
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
