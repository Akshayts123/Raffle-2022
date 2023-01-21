

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controller/home_controller.dart';
import '../../../../utils/style.dart';
import '../../../widgets/more/more.dart';
import '../../Deals/widgets/catogory_heading.dart';

Widget HelpSupport(){
  final HomeController _coffeeController = Get.find();
  return Container(
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Heading(text: "Help and Support",)
              ),
             more()
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 0, top: 0),
          height: 115,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Row(
                      children: [

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            RawMaterialButton(
                              onPressed: () {},
                              constraints: BoxConstraints(),
                              elevation: 2.0,
                              fillColor:context.theme.cardColor,
                              child: Container(
                                height:17,
                                width: 27,
                                decoration: BoxDecoration(
                                  color: Style.systemblue,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Transform.translate(
                                        child: Container(
                                          child: Image.asset(
                                            _coffeeController.getHomesList[index].help ??
                                                "",
                                            width: 20.0,
                                            color: Colors.orange,
                                            height: 20.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        offset: Offset(3.5, -0),
                                      ),
                                    ),
                                  ]
                                  ,),
                              ),
                              padding: EdgeInsets.only(left: 10.0,right: 10,top: 15,bottom: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Container(
                                padding: EdgeInsets.only(left: 13),
                                width: 85,
                                child: Text(
                                  _coffeeController
                                      .getHomesList[index].btndesc ??
                                      "",
                                  style: context.theme.textTheme.titleSmall,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }
                return Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            onPressed: () {},
                            constraints: BoxConstraints(),
                            elevation: 2.0,
                            fillColor: context.theme.cardColor,
                            child: Image.asset(
                              _coffeeController.getHomesList[index].help ??
                                  "",
                              width: 27.0,
                              color: context.theme.indicatorColor,
                              height: 27.0,
                              fit: BoxFit.cover,
                            ),
                            padding: EdgeInsets.all(10.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Container(
                              padding: EdgeInsets.only(left: 13),
                              width: 85,
                              child: Text(
                                _coffeeController
                                    .getHomesList[index].btndesc ??
                                    "",
                                style:context.theme.textTheme.titleSmall,
                              ),
                            ),
                          ),
                        ],
                      )
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