import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';

class newconnection extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
  newconnection({Key? key}) : super(key: key);

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
                    "Get a new connection",
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
            padding: EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15, top: 20),
                      height: 115,
                      child: ListView.builder(
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
                                    fillColor: Colors.white,
                                    child: Image.asset(
                                      _coffeeController.getHomesList[index].img ??
                                          "",
                                      width: 27.0,
                                      color: Colors.grey,
                                      height: 27.0,
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
                                            fontSize: 13, color: Colors.black),
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
                      padding: EdgeInsets.only(
                        left: 15,
                      ),
                      height: 110,
                      child: ListView.builder(
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
                                    fillColor: Colors.white,
                                    child: Image.asset(
                                      _coffeeController.getHomesList[index].img ??
                                          "",
                                      width: 27.0,
                                      color: Colors.grey,
                                      height: 27.0,
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
                                            fontSize: 13, color: Colors.black),
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
                Container(
                  height: 200,
                  width: 180,

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
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 7,
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
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Icon(
                                Icons.keyboard_double_arrow_right,
                                color: Colors.white,
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
