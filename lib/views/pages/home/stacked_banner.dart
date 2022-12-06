

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';

class stackedbanner extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
   stackedbanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40, bottom: 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: Container(
              // padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
              alignment: Alignment.topCenter,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 110,
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
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                  "source framework by Google for building beautiful",
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          child: TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text("Watch now ",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                Icon(
                                  Icons.double_arrow_rounded,
                                  size: 14,
                                  color: Colors.white,
                                )
                              ],
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
                            translation: Offset(0.15, -0.2),
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  "assets/bane1.jpeg",
                                  width: 135.0,
                                  height: 135.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: FractionalTranslation(
                            translation: Offset(-0.92, -0.16),
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  "assets/bane.jpeg",
                                  width: 110.0,
                                  height: 160.0,
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
          ),

        ],
      ),
    );
  }
}
