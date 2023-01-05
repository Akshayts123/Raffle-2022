
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../controller/home_controller.dart';
import '../../../../utils/style.dart';

class TabWidget extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
  TabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 270,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   padding: EdgeInsets.only(left: 20,top: 0),
          //   child: Text("Up Next", style: GoogleFonts.poppins(
          //       fontSize: 15,
          //       color: Style.blackcolor,
          //       fontWeight: FontWeight.w600),),
          // ),
          Container(
            height:265,
            padding:Pods.TOP_SMALL_PADDING,
            child: ListView.builder(
              shrinkWrap: true,
              padding: Pods.LEFT_PADDING,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: _coffeeController.getHomesList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(_coffeeController
                                .getHomesList[index]
                                .tab ??
                                "",
                                fit: BoxFit.cover,
                                height: 190,
                                width: 300),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Lorem Ipsum", style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Style.blackcolor,
                              fontWeight: FontWeight.w600),),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("New \$300", style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: Style.greycolor,
                              fontWeight: FontWeight.w500),),
                        ),
                      ],
                    ),

                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
