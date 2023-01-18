

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controller/home_controller.dart';
import '../../../../utils/style.dart';

Widget Tickets(){
  final HomeController _coffeeController = Get.find();
  return Container(

    height: 360,
    color: Colors.grey[200],
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 10, top: 10, right: 0, bottom: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "watch live performances",
                style: Style.mainheading,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: RawMaterialButton(
                  onPressed: () {},
                  constraints: BoxConstraints(),
                  elevation: 0.0,
                  fillColor: Style.whitecolor,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Style.blackcolor),
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(
                      Icons.chevron_right,
                      size: 20,
                    ),
                  ),
                  padding: EdgeInsets.all(0.0),
                  shape: CircleBorder(),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Container(
          padding: EdgeInsets.only(left: 10, top: 0, right: 0, bottom: 0),
          child: Text("source framework by Google for building beautiful",
              style: Style.text911),
        ),
        SizedBox(
          height: 0,
        ),
        Container(
          height: 250,
          child: ListView.builder(
            shrinkWrap: true,
            padding: Pods.LEFT_WIDE_PADDING,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(top: 20, right: 15),
                width: 170,
                height: 250,
                decoration: BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage(
                      _coffeeController.getHomesList[index].coupen ?? "",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Transform.translate(
                        offset: Offset(0, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: FractionalOffset.center,
                                end: FractionalOffset.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Style.blackcolor // I don't know what Color this will be, so I can't use this
                                ]),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Transform.translate(
                        offset: Offset(0, 180),
                        child: Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Elvin loyd",
                                      style:Style.text111,
                                    ),
                                    Text(
                                      "\$ 30",
                                      style: Style.text1
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "9th Dec",
                                      style: Style.text51
                                    ),
                                    Text(
                                      ". 10:00 pm",
                                      style:Style.text51
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Transform.translate(
                        offset: Offset(-10, -10),
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Transform.translate(
                        offset: Offset(10, -10),
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              color:Colors.grey[200],
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Transform.translate(
                        offset: Offset(-10, 10),
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              color:Colors.grey[200],
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Transform.translate(
                        offset: Offset(10, 10),
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Transform.translate(
                        offset: Offset(-8, -55),
                        child: Container(
                          height: 17,
                          width: 17,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Transform.translate(
                        offset: Offset(8, -55),
                        child: Container(
                          height: 17,
                          width: 17,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Transform.translate(
                        child: Container(
                          height: 7,
                          margin: EdgeInsets.only(
                            top: 15,
                          ),
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 17,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color:Colors.grey[200],
                                      borderRadius:
                                      BorderRadius.circular(30)),
                                  margin: EdgeInsets.only(left: 5),
                                  width: 7,
                                  height: 7,
                                );
                              }),
                        ),
                        offset: Offset(0, -19),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Transform.translate(
                        child: Container(
                          height: 7,
                          margin: EdgeInsets.only(
                            top: 15,
                          ),
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 17,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color:Colors.grey[200],
                                      borderRadius:
                                      BorderRadius.circular(30)),
                                  margin: EdgeInsets.only(left: 5),
                                  width: 7,
                                  height: 7,
                                );
                              }),
                        ),
                        offset: Offset(0, 4),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Transform.translate(
                        child: Container(
                          height: 7,
                          margin: EdgeInsets.only(
                            top: 15,
                          ),
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 17,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color:Colors.grey[200],
                                      borderRadius:
                                      BorderRadius.circular(30)),
                                  margin: EdgeInsets.only(left: 5),
                                  width: 7,
                                  height: 7,
                                );
                              }),
                        ),
                        offset: Offset(0, -60),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}