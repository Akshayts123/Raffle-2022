

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/style.dart';

JobHeaderSlider(String Text1,String Text2,String Text3,String Images) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            Text1,
            style: Style.text101,
          ),
          Text(
            Text2,
            style: Style.text28,
          )
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              children: [
                Image.asset(
                  Images,
                  width: 25.0,
                  height: 25.0,
                  color: Colors.green,
                  fit: BoxFit.cover,
                ),
                Text(
                  Text3,
                  style: Style.text28,
                )
              ],
            ),
          )
        ],
      )
    ],
  );
}