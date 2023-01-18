

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/style.dart';

Widget SliderWidget(){

  return Container(
    decoration: new BoxDecoration(
      // color: Color(0xFF4347F0),
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.purple, Color(0xFF4347F0)])
      // image: new DecorationImage(
      //   fit: BoxFit.cover,
      //
      //   // colorFilter: new ColorFilter.mode(
      //   //     Colors.black.withOpacity(0.0), BlendMode.darken),
      //   image: AssetImage(_coffeeController
      //           .getHomesList[index].backimg ??
      //       ""),
      // ),
    ),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: 15,top: 25
            ),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  child: Text(
                    "Jing A Studio",
                    style: Style.text16
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width:210,
                  child: Text(
                    "Tell me your dream",
                    style: Style.text411
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width:310,
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    style: Style.text9111
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 100,

                  height: 35,
                  decoration: BoxDecoration(
                      color: Color(0xFFE1962A),
                      borderRadius: BorderRadius.circular(5)
                  ),

                  child: TextButton(
                    onPressed: (){},
                    child: Text("Details",style: Style.text91111,),
                  ),
                )
              ],
            ),
          ),
        ]),
  );
}