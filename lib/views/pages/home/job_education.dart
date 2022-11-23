

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';

class jobeducation extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
 jobeducation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, top: 15, right: 0, bottom: 15),
      height: 600,
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Job & Education ",
                style: GoogleFonts.poppins(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
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
          SizedBox(
            height: 5,
          ),
          Container(
            child: Text("source framework by Google for building beautiful",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(right: 15),
            height: 475,
            child: ListView.builder(
              itemCount: 3,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 15),
                  height: 140,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.3), BlendMode.darken),
                      image:
                      AssetImage(_coffeeController.getHomesList[index].backimg??""),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 150,
                              child: Text(
                                "2 Pizza starting at \$10 each",
                                style: GoogleFonts.poppins(
                                  fontSize: 17,
                                  height: 1.2,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              // width:210,
                              child: Text(
                                "EXPLORE TO OF EATRIES NEARBY",
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  height: 1.2,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: FractionalTranslation(
                          translation: Offset(0, 0),
                          child: Container(
                            child: Image.asset(
                              _coffeeController.getHomesList[index].people??"",
                              width: 120,
                              height: 140,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 10, top: 20),
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7)),
                          width: 42,
                          height: 42,
                          child: Center(
                            child: Image.asset(
                              _coffeeController.getHomesList[index].bis??"",
                              width: 35.0,
                              height: 35.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
