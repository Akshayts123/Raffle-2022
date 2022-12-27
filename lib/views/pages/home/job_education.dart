

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/style.dart';

class jobeducation extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
 jobeducation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10, right: 0, bottom: 0),
      height: 480,
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Job & Education ",
                style: Style.mainheading,
              ),
              RawMaterialButton(
                onPressed: () {},
                constraints: BoxConstraints(),
                elevation: 0.0,
                fillColor: Style.whitecolor,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color:Style.blackcolor),
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
            child: Text("source framework by Google for building beautiful",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Style.blackcolor,
                )),
          ),
          SizedBox(
            height: 0,
          ),
          Container(
            padding: EdgeInsets.only(right: 15,left: 5),
            height: 400,
            child: ListView.builder(
              itemCount: 3,
              // padding: EdgeInsets.only(bottom: 10),
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                if(index == 0){
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 110,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: new DecorationImage(
                        fit: BoxFit.cover,
                        // colorFilter: new ColorFilter.mode(
                        //     Colors.black.withOpacity(0.0), BlendMode.darken),
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
                                    color: Style.blackcolor,
                                    fontWeight: FontWeight.w600,
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
                                    color: Style.blackcolor,
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
                          padding: EdgeInsets.only(right: 10, top: 10),
                          alignment: Alignment.topRight,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Style.whitecolor,
                                borderRadius: BorderRadius.circular(7)),
                            width: 37,
                            height: 37,
                            child: Center(
                              child: Image.asset(
                                _coffeeController.getHomesList[index].bis??"",
                                width: 33.0,
                                height: 33.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: 110,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      // colorFilter: new ColorFilter.mode(
                      //     Colors.black.withOpacity(0.1), BlendMode.darken),
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
                                  color: Style.whitecolor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  // width:210,
                                  child: Text(
                                    "EXPLORE TO OF EATRIES NEARBY",
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      height: 1.2,
                                      color: Style.whitecolor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
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
                        padding: EdgeInsets.only(right: 10, top: 10),
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Style.whitecolor,
                              borderRadius: BorderRadius.circular(7)),
                          width: 37,
                          height: 37,
                          child: Center(
                            child: Image.asset(
                              _coffeeController.getHomesList[index].bis??"",
                              width: 33.0,
                              height: 33.0,
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
