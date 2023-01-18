import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/style.dart';



Appbar(context, height) {
  return PreferredSize(
    preferredSize: Size(MediaQuery.of(context).size.width, height + 60),
    child: Stack(
      children: <Widget>[
        Container(
          // Background
          child: Center(
            child: Text("Job Portal", style: Style.text41),
          ),
          color: Style.systemblue,
          height: height + 55,
          width: MediaQuery.of(context).size.width,
        ),
        Container(), // Required some widget in between to float AppBar
        Positioned(
          // To take AppBar Size only
          top: 80.0,
          left: 10.0,
          right: 10.0,
          child: Container(
            decoration: BoxDecoration
              (border: Border.all(width: 1,color: Colors.white)),
            child: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(Icons.search, color: Style.systemblue),
                onPressed: () {},
              ),
              primary: false,
              title: TextField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey))),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.filter_list_alt, color: Style.systemblue),
                  onPressed: () {},
                ),
                Container(
                  height: 10,
                  width: 50,
                  color: Style.systemblue,
                  child: IconButton(
                    icon: Icon(Icons.search, color: Style.whitecolor),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
