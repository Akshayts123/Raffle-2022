
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/style.dart';
class DotText extends StatelessWidget {
  String text;
   DotText({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 7.0,
            height: 7.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: context.theme.focusColor),
          ),
        ),
        Container(
            width:330,
            child: Text(
                text,
                style:context.theme.textTheme.titleLarge))
      ],
    );
  }
}
