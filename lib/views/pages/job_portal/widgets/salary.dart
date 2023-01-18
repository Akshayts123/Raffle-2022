

import 'package:flutter/cupertino.dart';

import '../../../../utils/style.dart';

Salary(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10,),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 10,
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Salary",
                style: Style.text9111,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "\$500 - \$1000",
                style: Style.text30,
              ),
            ],
          ),
        ),
        Spacer(),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Experience",
                style: Style.text9111,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "3-5 Years",
                style: Style.text30,
              ),
            ],
          ),
        ),
        Spacer(),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Employment",
                style: Style.text9111,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Intern",
                style: Style.text30,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}