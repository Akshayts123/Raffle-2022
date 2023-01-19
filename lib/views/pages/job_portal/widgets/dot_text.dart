
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/style.dart';

DotText(String text){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 7.0,
          height: 7.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.black),
        ),
      ),
      Container(
          width:330,
          child: Text(
            text,
              style: Style.text32))
    ],
  );
}