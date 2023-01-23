

import 'package:draw_idea/views/pages/job_portal/widgets/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/home_controller.dart';
import '../../../../utils/style.dart';
class Designation extends StatelessWidget {
  final index;
  final HomeController _coffeeController = Get.find();
   Designation({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                _coffeeController
                    .getHomesList[index].services ??
                    "",
                width: 50.0,
                height: 50.0,
                fit: BoxFit.contain,
              ),
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
                      _coffeeController.designation[index],
                      style: context.theme.textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      _coffeeController.studio[index],
                      style: Style.text9111,
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
                    Wishlist(),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Posted 2h ago",
                      style: Style.text9111,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(CupertinoIcons.building_2_fill,size: 20,color: context.theme.selectedRowColor,),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Fulltime,Office", style: context.theme.textTheme.bodyLarge,)
                  ],
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon( Icons.date_range,size: 20,color:context.theme.selectedRowColor,),
                    SizedBox(
                      width: 10,
                    ),
                    Text("21-02-2023", style: context.theme.textTheme.bodyLarge)
                  ],
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(CupertinoIcons.location_solid,size: 20,color:context.theme.selectedRowColor,),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Japan", style: context.theme.textTheme.bodyLarge,)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

