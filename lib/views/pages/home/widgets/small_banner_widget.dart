

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/home_controller.dart';
import '../../../../utils/style.dart';

class SmallBannerWidget extends StatelessWidget {
  final index;
  final offer;
  final text;

   SmallBannerWidget({Key? key,required this.index,required this.offer,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    color: context.theme.cardColor,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15)
                          ),
                          child: SizedBox(
                            width: 170,
                            height: 105,
                            child: Image.asset(
                              offer,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                              text,
                              style: context.theme.textTheme.bodySmall,
                          ),
                        )
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
