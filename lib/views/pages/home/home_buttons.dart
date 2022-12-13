import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/style.dart';

class homemenu extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
  homemenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 85,
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 5),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: _coffeeController.getHomesList.length,
          itemBuilder: (BuildContext context, int index) {

           if(index == 0){
            return Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: TextButton(
                      style: ButtonStyle(),
                      onPressed: () {},
                      child: Column(
                        children: [
                          Image.asset(
                            _coffeeController.getHomesList[index].gif ?? "",
                            width: 35.0,
                            height: 35.0,
                            color: Style.whitecolor,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            _coffeeController.getHomesList[index].Name ?? "",
                            style: GoogleFonts.poppins(
                                fontSize: 15, color: Style.whitecolor,fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 0, top: 0),
                    decoration: BoxDecoration(
                        color: Color(0xFFFFC502),
                        borderRadius: BorderRadius.circular(15)),
                    width: 50,
                    height: 5,
                  ),
                ],
              ),
            );
           }
            return  Container(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: TextButton(
                    style: ButtonStyle(),
                    onPressed: () {},
                    child: Column(
                      children: [
                        Image.asset(
                          _coffeeController.getHomesList[index].gif ?? "",
                          width: 35.0,
                          height: 35.0,
                          color: Style.whitecolor,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          _coffeeController.getHomesList[index].Name ?? "",
                          style: GoogleFonts.poppins(
                              fontSize: 15, color:Style.whitecolor,fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
          }
        ),
      ),
    );
  }
}
