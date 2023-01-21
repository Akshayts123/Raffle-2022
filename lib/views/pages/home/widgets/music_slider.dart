

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controller/home_controller.dart';
import '../../../../utils/style.dart';
import '../../../widgets/more/more.dart';
import '../../Deals/widgets/catogory_heading.dart';

class MusicSlider extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
   MusicSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  Pods.TOP_PADDING,
      child: Column(
        children: [
          Container(
            padding:  Pods.LEFT_PADDING,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Heading(text: "Trending music",),
                ),
                more()
              ],
            ),
          ),
          Container(
            height: 200,
            padding: EdgeInsets.only(top: 10),
            child: ListView.builder(
              padding:  Pods.LEFT_WIDE_PADDING,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: _coffeeController.getHomesList.length,
              itemBuilder: (BuildContext context, int index) =>
                  Container(
                    margin: EdgeInsets.only(right:15 ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            _coffeeController.getHomesList[index].music??"",
                            height: 140,
                            width: 140,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.only(left: 0),
                          child: Text(
                            "Music",
                            style: context.theme.textTheme.titleSmall,

                          ),
                        ),
                      ],
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

