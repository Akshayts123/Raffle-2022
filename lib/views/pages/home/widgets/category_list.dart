
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/home_controller.dart';
import '../../../../utils/style.dart';

CategoryList(){
  final HomeController _coffeeController = Get.find();
  return GridView.builder(
    shrinkWrap: true,
    itemCount:8,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (BuildContext _context, int index) {
      return Container(
        // margin: EdgeInsets.only(left:3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    // border: Border.all(width: 1,color: Style.systemblue),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: RawMaterialButton(

                    onPressed: () {},
                    constraints: BoxConstraints(),
                    elevation: 3.0,
                    fillColor: Style.whitecolor,
                    child:Image.asset(
                      _coffeeController.getHomesList[index].img??"",
                      width: 26.0,
                      color: Style.systemblue,
                      height: 26.0,
                      fit: BoxFit.cover,
                    ),
                    padding: EdgeInsets.all(12.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    // padding: EdgeInsets.only(left: 13),
                    // width: 85,
                    child: Text(
                      "lorem",
                      style:Style.text2,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    },
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 100.0,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
    ),
  );
}