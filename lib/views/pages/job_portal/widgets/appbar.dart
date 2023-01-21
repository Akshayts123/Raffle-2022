import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/style.dart';

class Appbar extends StatelessWidget {
  final height;
  String text;
   Appbar({Key? key, required this.text,required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, height + 50),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            // Background
            child: Center(
              child: Text(text, style: Style.text41),
            ),
            color: Style.systemblue,
            height: height + 67,
            width: MediaQuery.of(context).size.width,
          ),
          Container(), // Required some widget in between to float AppBar
          Positioned(
            // To take AppBar Size only
            top: 95.0,
            left: 10.0,
            right: 10.0,
            child: Container(
              decoration: BoxDecoration
                (border: Border.all(width: 1,color: Colors.white)),
              child: AppBar(
                backgroundColor: context.theme.canvasColor,
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
}


