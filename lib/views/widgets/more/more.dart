

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/style.dart';

class more extends StatelessWidget {
  const more({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: const EdgeInsets.only(right: 0.0),
      child: RawMaterialButton(
        onPressed: () {},
        constraints: BoxConstraints(),
        elevation: 0.0,
        fillColor:Style.whitecolor,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Style.blackcolor),
              borderRadius: BorderRadius.circular(30)),
          child: Icon(
            Icons.chevron_right,
            size: 20,
            color: context.theme.hoverColor,
          ),
        ),
        padding: EdgeInsets.all(0.0),
        shape: CircleBorder(),
      ),
    );
  }
}
