

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/style.dart';
class Salary extends StatelessWidget {
  const Salary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  style: context.theme.textTheme.bodyLarge,
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
                  style: context.theme.textTheme.bodyLarge,
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
                  style: context.theme.textTheme.bodyLarge,
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
}

