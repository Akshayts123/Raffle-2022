



import 'package:draw_idea/views/pages/Deals/widgets/catogory_heading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../utils/style.dart';

NewAppbar(String heading){
  return   Stack(
    clipBehavior: Clip.none,
    children: <Widget>[
      // Required some widget in between to float AppBar
      Container(
        padding: EdgeInsets.only(top: 35, left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Container(
                height: 40,
                width: 40,

                // decoration: BoxDecoration(
                //     border: Border.all(width: 1, color: Colors.white),
                //     borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.arrow_back_ios,
                      color: Style.whitecolor),
                ),
              ),
            ),
            Container(
              height: 40,
              width: 40,
              // decoration: BoxDecoration(
              //     border: Border.all(width: 1, color: Colors.white),
              //     borderRadius: BorderRadius.circular(3)),
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Icon(Icons.more_vert,
                    color: Style.whitecolor),
              ),
            ),
          ],
        ),
        color: Style.systemblue,
        height: 125,
        width: double.infinity,
      ),
      Positioned(
        // To take AppBar Size only
        top: 67.0,
        left: 10.0,
        right: 10.0,
        child: Center(
          child:Text(heading,style: Style.subheading,)
        ),
      )
    ],
  );
}