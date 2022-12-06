import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';

class featuredoffer extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
  featuredoffer({Key? key}) : super(key: key);

  @override
  bool first = true;
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 170,
        // margin: EdgeInsets.only(
        //   top: 15,

        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(top: 40, left: 10, right: 7),
              width: 210,
              height: 190,
              decoration: BoxDecoration(
                color: _coffeeController.coloring[index],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Transform.translate(
                      child: Image.asset(
                        "assets/feature1.gif",
                        width: 100.0,
                        height: 170.0,
                        fit: BoxFit.cover,
                      ),
                      offset: Offset(0, -70),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Transform.translate(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150,
                                child: Text(
                                  "International Roaming ",
                                  style: GoogleFonts.poppins(
                                      fontSize: 17,
                                      color: (index == 9)
                                          ? Colors.white
                                          : (index == 8)
                                              ? Colors.black
                                              : (index % 2 == 0)
                                                  ? Colors.white
                                                  : Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Container(
                                width: 200,
                                child: Text(
                                  "Unlimited calls & datas for 28 days international destinations",
                                  style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color:  (index == 9)
                                          ? Colors.white
                                          : (index == 8)
                                          ? Colors.black
                                          : (index % 2 == 0)
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      offset: Offset(0, 20),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
