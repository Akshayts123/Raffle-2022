

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/style.dart';
class TabItem extends StatelessWidget {
  final hatric ;
  final text1;
  final text2;
  final text3;
  const TabItem({Key? key,required this.hatric,required this.text1,required this.text2,required this.text3}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                width: 135.0,
                height: 135.0,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 0,
              ),
              Text(
                text1,
                style: context.theme.textTheme.titleMedium,
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
                style:context.theme.textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

