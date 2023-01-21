

import 'package:draw_idea/views/pages/home/widgets/small_banner_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controller/home_controller.dart';
import '../../../../utils/style.dart';
Widget SmallBanner(){
  final HomeController _coffeeController = Get.find();
  var banner =true;
  return Container(
    child: Column(
      children: [
        Container(
          height: 160,

          child: ListView.builder(
              padding: EdgeInsets.only(top: 20,left: 13),
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: _coffeeController.getHomesList.length ,
              itemBuilder: (BuildContext context, int index) {
                if (index == 1 )
                {
                 return SmallBannerWidget(index: index, offer:  _coffeeController
                      .getHomesList[index].offer ??
                      "", text: 'Sony LIV for 1 year ',);
                }
                if (index == 4  )
                {
                  return SmallBannerWidget(index: index, offer:  _coffeeController
                      .getHomesList[index].offer ??
                      "", text: 'Sony LIV for 1 year ',);
                }
                if (index ==7  )
                {
                  return SmallBannerWidget(index: index, offer:  _coffeeController
                      .getHomesList[index].offer ??
                      "", text: 'Sony LIV for 1 year ',);
                }
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 160,
                              height: 140,
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Column(
                                  children: [

                                    SizedBox(
                                      width: 170,
                                      height: 75,
                                      child: Image.asset(
                                        _coffeeController.getHomesList[index]
                                            .offer ??
                                            "",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(children: [
                                        Text(
                                          'On \$3099 recharge',
                                          style: context.theme.textTheme.titleMedium
                                        ),
                                        Text(
                                          'Using Credit Card',
                                          style:context.theme.textTheme.titleSmall
                                        )
                                      ]),
                                    )
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
          ),
        ),
      ],
    ),
  );

}