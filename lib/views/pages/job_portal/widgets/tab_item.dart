

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/style.dart';

TabItem(String hatric ,String text1,String text2,String text3){
 return Container(
    padding: EdgeInsets.only(right: 10),
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      child: Container(
        height: 170,
        width: 250,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Image.asset(
              hatric,
              width: 125.0,
              height: 125.0,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text1,
              style: Style.text4,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text2,
              style: Style.text9111,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text3,
              style: Style.text4,
            ),
          ],
        ),
      ),
    ),
  );

}