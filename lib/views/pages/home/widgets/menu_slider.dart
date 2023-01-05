

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controller/home_controller.dart';
import '../../../../utils/style.dart';

Widget MenuSlider(){
  final HomeController _coffeeController = Get.find();
  return Container(
    height: 120,
    child: ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 0,top: 15),
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: _coffeeController.getHomesList.length,
      itemBuilder: (BuildContext context, int index) =>
          Container(
            margin: EdgeInsets.only(left:3),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RawMaterialButton(

                      onPressed: () {},
                      constraints: BoxConstraints(),
                      elevation: 3.0,
                      fillColor: Style.whitecolor,
                      child:Image.asset(
                        _coffeeController.getHomesList[index].img??"",
                        width: 26.0,
                        color: Style.systemblue,
                        height: 26.0,
                        fit: BoxFit.cover,
                      ),
                      padding: EdgeInsets.all(12.0),
                      shape: CircleBorder(),
                    ),
                    // Container(
                    //   width: 55,
                    //   height: 55,
                    //   decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.circular(50)),
                    //   margin: EdgeInsets.symmetric(horizontal: 15),
                    //   child: ElevatedButton(
                    //     onPressed: () {},
                    //     child: Image.asset(
                    //       _coffeeController.getHomesList[index].img??"",
                    //       width: 35.0,
                    //       color: Colors.red,
                    //       height: 35.0,
                    //       fit: BoxFit.cover,
                    //     ),
                    //     style: ButtonStyle(
                    //       elevation: MaterialStatePropertyAll(2.8),
                    //       shape: MaterialStateProperty.all(CircleBorder()),
                    //       padding: MaterialStateProperty.all(EdgeInsets.all(
                    //           13)),
                    //       backgroundColor: MaterialStateProperty.all(
                    //           Colors.white),
                    //       // <-- Button color
                    //       overlayColor:
                    //       MaterialStateProperty.resolveWith<Color?>((states) {
                    //         if (states.contains(MaterialState.pressed))
                    //           return Colors.black12;
                    //       }),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(left: 13),
                        width: 85,
                        child: Text(
                          _coffeeController.getHomesList[index].btndesc??"",
                          style: GoogleFonts.poppins(
                              fontSize: 13, color: Style.blackcolor),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
    ),
  );
}