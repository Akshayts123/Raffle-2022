import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';

class latestmovies extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
  latestmovies({Key? key}) : super(key: key);

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
                      "Latest Movies",
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
            height: 260,
            padding: EdgeInsets.only(top: 15),
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: _coffeeController.getHomesList.length,
              itemBuilder: (BuildContext context, int index) => Container(
                padding: EdgeInsets.only(left: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Container(
                        // padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                        alignment: Alignment.topCenter,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              // margin: EdgeInsets.only(top: 30),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  _coffeeController.getHomesList[index].movie ??
                                      "",
                                  height: 200,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: FractionalTranslation(
                                      translation: Offset(-0.5, 0),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            _coffeeController
                                                    .getHomesList[index].no ??
                                                "",
                                            height: 55,
                                            color: Colors.white,
                                            width: 55,
                                            fit: BoxFit.cover,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: FractionalTranslation(
                                      translation: Offset(-1.5, 0),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            _coffeeController
                                                    .getHomesList[index].no2 ??
                                                "",
                                            height: 55,
                                            color: Colors.red,
                                            width: 55,
                                            fit: BoxFit.cover,
                                          ),
                                        ],
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
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Kesariya ",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
