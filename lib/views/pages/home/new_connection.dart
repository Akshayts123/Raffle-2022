import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/style.dart';

class newconnection extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
  newconnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10,top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "Get a new connection",
                    style: Style.mainheading,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 0.0),
                  child: RawMaterialButton(
                    onPressed: () {},
                    constraints: BoxConstraints(),
                    elevation: 0.0,
                    fillColor:Style.whitecolor,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Style.blackcolor),
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(
                        Icons.chevron_right,
                        size: 20,
                      ),
                    ),
                    padding: EdgeInsets.all(0.0),
                    shape: CircleBorder(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 100,
                      child: ListView.builder(
                        padding: EdgeInsets.only( top: 0),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) =>
                            Container(
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RawMaterialButton(
                                    onPressed: () {},
                                    constraints: BoxConstraints(),
                                    elevation: 2.0,
                                    fillColor: Style.whitecolor,
                                    child: Image.asset(
                                      _coffeeController.getHomesList[index].img ??
                                          "",
                                      width: 25.0,
                                      color: Colors.black54,
                                      height: 25.0,
                                      fit: BoxFit.cover,
                                    ),
                                    padding: EdgeInsets.all(10.0),
                                    shape: CircleBorder(),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Container(
                                      padding: EdgeInsets.only(left: 13),
                                      width: 85,
                                      child: Text(
                                        _coffeeController
                                                .getHomesList[index].btndesc ??
                                            "",
                                        style: GoogleFonts.poppins(
                                            fontSize: 13, color:Style.blackcolor),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(

                      height: 100,
                      child: ListView.builder(
                        padding: EdgeInsets.only(
                          left: 0,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) =>
                            Container(
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RawMaterialButton(
                                    onPressed: () {},
                                    constraints: BoxConstraints(),
                                    elevation: 2.0,
                                    fillColor: Style.whitecolor,
                                    child: Image.asset(
                                      _coffeeController.getHomesList[index].img ??
                                          "",
                                      width: 25.0,
                                      color: Colors.black54,
                                      height: 25.0,
                                      fit: BoxFit.cover,
                                    ),
                                    padding: EdgeInsets.all(10.0),
                                    shape: CircleBorder(),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Container(
                                      padding: EdgeInsets.only(left: 13),
                                      width: 85,
                                      child: Text(
                                        _coffeeController
                                                .getHomesList[index].btndesc ??
                                            "",
                                        style: GoogleFonts.poppins(
                                            fontSize: 13, color:Style.blackcolor),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 190,
                  width: 170,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/back.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/combo.png",
                            height: 110,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "Portable wifi-free home delivery",
                            style: GoogleFonts.poppins(
                                fontSize: 17,
                                color: Style.whitecolor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  "Order now",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: Style.whitecolor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Icon(
                                Icons.keyboard_double_arrow_right,
                                color: Style.whitecolor,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
